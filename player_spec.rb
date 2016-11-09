require('minitest/autorun')
require('minitest/rg')
require_relative('player')

class TestPlayer < Minitest::Test
  def setup
    @player1 = Player.new("Cameron")
  end

  def test_return_name
    assert_equal("Cameron", @player1.name)
  end
end