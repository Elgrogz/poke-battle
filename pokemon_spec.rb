require('minitest/autorun')
require('minitest/rg')
require_relative('pokemon')

class TestPokemon < Minitest::Test
  def setup
    @pokemon1 = Pokemon.new("Charizard","fire")
  end

  def test_return_pokemon_name
    assert_equal("Charizard", @pokemon1.name)
  end

  def test_return_hit_points
    assert_equal(100, @pokemon1.return_hit_points )
  end
end

