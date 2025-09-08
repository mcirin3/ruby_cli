

require "minitest/autorun"
$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))
require "recipes_db"

class TestRecipe < Minitest::Test
  def setup
    @recipe = LutongBahay::RecipesDB.all.first
  end

  def test_step_bounds
    assert_nil @recipe.step(-1)
    assert_nil @recipe.step(@recipe.step_count)
    refute_nil @recipe.step(0)
  end

  def test_to_s_has_name
    s = @recipe.to_s
    assert_includes s, @recipe.name
  end
end
