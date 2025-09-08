# frozen_string_literal: true

require_relative "recipes_db"

module LutongBahay
  class CLI
    attr_reader :recipes
    attr_accessor :current_recipe

    def initialize(io_in: $stdin, io_out: $stdout)
      @in = io_in
      @out = io_out
      @recipes = RecipesDB.all
      @current_recipe = nil
      @step_index = 0
    end

    def clear_screen
      system("clear") || system("cls")
    end

    # custom bounded writer for step index
    def step_index=(idx)
      if @current_recipe.nil?
        @step_index = 0
      else
        @step_index = [[idx, 0].max, @current_recipe.step_count - 1].min
      end
    end

    def run
      print_welcome
      loop do
        if @current_recipe
          print_step_prompt
        else
          print_menu
        end

        input = @in.gets
        break if input.nil? # EOF
        cmd = input.chomp.strip

        break if %w[quit q exit].include?(cmd.downcase)

        if @current_recipe
          handle_step_command(cmd)
        else
          handle_menu_command(cmd)
        end
      end

      @out.puts "\nSalamat! (Thank you) Goodbye!"
    end

    # ------- Menu mode -------
    def print_welcome
      @out.puts "=== Lutong Bahay CLI ==="
      @out.puts "Discover Filipino recipes and cook step by step."
      @out.puts "Type 'help' any time. Type 'exit' to quit.\n\n"
    end

    def print_menu
      clear_screen
      @out.puts "Available recipes:"
      @recipes.each_with_index do |r, i|
        @out.puts "  #{i + 1}. #{r.name} - [#{r.tags.join(', ')}]"
      end
      @out.puts "\nEnter a number to choose, or type: search <term>, list, help, exit"
      @out.print("> ")
    end

    def handle_menu_command(cmd)
      case cmd
      when /^help$/i
        menu_help
      when /^list$/i
        # just reprint in next loop
      when /^search\s+(.+)/i
        term = Regexp.last_match(1).downcase
        results = @recipes.each_with_index.select do |(r, _i)|
          r.name.downcase.include?(term) ||
            r.tags.any? { |t| t.downcase.include?(term) }
        end
        if results.empty?
          @out.puts "No matches for '#{term}'."
        else
          @out.puts "Search results:"
          results.each do |(r, i)|
            @out.puts "  #{i + 1}. #{r}"
          end
        end
      when /^\d+$/
        idx = cmd.to_i - 1
        if idx >= 0 && idx < @recipes.size
          self.current_recipe = @recipes[idx]
          self.step_index = 0
          show_recipe_header
          show_ingredients
          show_current_step
        else
          @out.puts "Invalid number."
        end
      else
        @out.puts "Unknown command. Type 'help' for options."
      end
    end

    def menu_help
      @out.puts <<~H
        Menu commands:
          [number]    choose a recipe by number
          search TAG  find recipes by name/tags (e.g., 'search soup')
          list        show recipes again
          help        show this help
          exit        quit the app
      H
    end

    # ------- Step mode -------
    def show_recipe_header
      clear_screen
      @out.puts "\n=== #{@current_recipe.name} ==="
    end

    def show_ingredients
      @out.puts "Ingredients:"
      @current_recipe.ingredients.each { |ing| @out.puts "  • #{ing}" }
      @out.puts
    end

    def show_current_step
      step = @current_recipe.step(@step_index)
      @out.puts "Step #{@step_index + 1}/#{@current_recipe.step_count}: #{step}"
    end

    def print_step_prompt
      @out.puts "\nCommands: next, prev, restart, ingredients, list, switch, help, exit"
      @out.print("(#{@current_recipe.name})> ")
    end

    def handle_step_command(cmd)
      case cmd.downcase
      when "help"
        step_help
      when "next", "n"
        if @step_index >= @current_recipe.step_count - 1
          @out.puts "You're at the last step. Type 'restart' to start over or 'switch' to pick another recipe."
        else
          self.step_index = @step_index + 1
          show_current_step
        end
      when "prev", "p"
        if @step_index <= 0
          @out.puts "You're at the first step."
        else
          self.step_index = @step_index - 1
          show_current_step
        end
      when "restart"
        self.step_index = 0
        show_current_step
      when "ingredients", "ing"
        show_ingredients
      when "list"
        # switch to menu mode without losing recipe
        @current_recipe = nil
      when "switch"
        @current_recipe = nil
        @out.puts "Switching… back to menu."
      else
        @out.puts "Unknown command. Type 'help' for step commands."
      end
    end

    def step_help
      @out.puts <<~H
        Step commands:
          next / n        go to next step
          prev / p        go to previous step
          restart         return to the first step
          ingredients     show ingredients again
          list            go back to recipe list (menu) but keep progress
          switch          go back to menu to pick another recipe
          exit            quit the app
      H
    end
  end
end
