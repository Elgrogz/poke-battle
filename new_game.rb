require_relative('game')
require_relative('pokemon')

@pokemon1 = Pokemon.new("Jigglypuff", "fairy")
@pokemon2 = Pokemon.new("Manky", "fighting")

@game1 = Game.new()

@game1.add_pokemon(@pokemon1)
@game1.add_pokemon(@pokemon2)

@game1.set_current_player
@game1.fight
puts @game1.pokemon_list
@game1.fight
@game1.fight
@game1.fight
@game1.fight
@game1.fight
@game1.fight

