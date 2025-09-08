module LutongBahay 
  class Recipe 
    attr_reader :name, :ingredients, :steps
    attr_accessor :tags 

    def initialize(name:, ingredients:, steps:, tags: [])
      @name = name 
      @ingredients = ingredients
      @steps = steps
      @tags = tags
    end

    def step(n)
      return nil if n.negative? || n >= @steps.size
      @steps[n]
    end

    def step_count 
      @steps.size
    end

    def to_s
      "#{name} {#{tags.join(', ')}}"
    end
  end
end
