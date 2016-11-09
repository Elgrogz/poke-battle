require('minitest/autorun')
require('minitest/rg')
require_relative('pokemon')
require_relative('game')

class TestGame < Minitest::Test
  def setup
    @pokemon1 = Pokemon.new("Jigglypuff", "fairy")
    @pokemon2 = Pokemon.new("Manky", "fighting")

    @game1 = Game.new()
  end

  def test_add_pokemon
    @game1.add_pokemon(@pokemon1)
    @game1.add_pokemon(@pokemon2)
    assert_equal(2, @game1.pokemon_list.length)
  end

  def test_current_pokemon__first_time
    @game1.add_pokemon(@pokemon1)
    @game1.add_pokemon(@pokemon2)
    assert_equal("Jigglypuff", @game1.current_player.name)
  end

  def test_current_pokemon__switch
    @game1.add_pokemon(@pokemon1)
    @game1.add_pokemon(@pokemon2)
    @game1.set_current_player
    assert_equal("Manky", @game1.current_player.name)
  end

  def test_fight
    @game1.add_pokemon(@pokemon1)
    @game1.add_pokemon(@pokemon2)
    @game1.fight
    assert_equal(80, @game1.pokemon_list[1].hit_points)
    @game1.set_current_player
    assert_equal(100, @game1.pokemon_list[1].hit_points)
    assert_equal(80, @game1.pokemon_list[0].hit_points)
  end

  def test_heal
    @game1.add_pokemon(@pokemon1)
    @game1.add_pokemon(@pokemon2)
    @game1.fight
    @game1.fight
    @game1.fight
    @game1.set_current_player
    @game1.heal
    assert_equal(50, @game1.pokemon_list[0].hit_points)
  end

  def test_win_check
    @game1.add_pokemon(@pokemon1)
    @game1.add_pokemon(@pokemon2)
    @game1.fight
    @game1.fight
    @game1.fight
    # assert_equal("continue", @game1.win_check)
    @game1.fight
    @game1.fight
    @game1.win_check
    assert_equal(1, @game1.pokemon_list.length)
  end

  def test_win
    @game1.add_pokemon(@pokemon1)
    @game1.add_pokemon(@pokemon2)
    @game1.fight
    @game1.fight
    @game1.fight
    @game1.fight
    @game1.fight
    @game1.win_check
    assert_equal("Jigglypuff", @game1.win)

  end

end