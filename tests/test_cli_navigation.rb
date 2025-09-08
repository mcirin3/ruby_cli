

require "minitest/autorun"
require "stringio"
$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))
require "lutong_bahay"

class TestCLINavigation < Minitest::Test
  def test_choose_recipe_and_next_step
    input = StringIO.new("1\nnext\nexit\n")
    output = StringIO.new
    cli = LutongBahay::CLI.new(io_in: input, io_out: output)
    cli.run

    out = output.string
    assert_includes out, "Available recipes:"
    assert_includes out, "=== Chicken Adobo ==="
    assert_match(/Step 1\/\d+:/, out)
    assert_match(/Step 2\/\d+:/, out)
  end

  def test_search_and_invalid
    input = StringIO.new("search soup\n42\nexit\n")
    output = StringIO.new
    cli = LutongBahay::CLI.new(io_in: input, io_out: output)
    cli.run

    out = output.string
    assert_includes out, "Search results:"
    assert_includes out, "Unknown command" # because 42 is not a valid index for the small list
  end
end
