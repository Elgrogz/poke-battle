require_relative('player')
require_relative('pokemon')
require('pry-byebug')

class Game
attr_reader :pokemon_list, :current_player, :winner, :name, :hit_points
  def initialize()
    @pokemon_list = []
    @winner = nil
  end

  def add_pokemon(pokemon)
    @pokemon_list.push(pokemon)
    @current_player = @pokemon_list[0]
  end

  def set_current_player
    @pokemon_list.rotate!
    @current_player = @pokemon_list[0]
  end

  def take_turn(input)
    if input == "fight"
      @current_player.fight
    elsif input == "heal"
      @current_player.heal
    end
  end

  def fight
      @pokemon_list[1].hit_points -= 20  
      return @pokemon_list[1].hit_points
  end

  def heal
    if @current_player.hit_points > 90
      @current_player.hit_points = 100
    else
      @current_player.hit_points += 10
    end
  end


  def win_check
    for pokemon in @pokemon_list
      if pokemon.hit_points <= 0
        @winner = pokemon.name
      end
    end
    return @winner
  end

  def win
    for pokemon in @pokemon_list
      if pokemon != loser
        pokemon = winner
    end

    puts "#{winner.name} is the winner!"
    exit
  end


  def new_turn
    prompt = "What would you like to do?\n Fight or heal?"
      puts prompt
    input = gets.chomp.downcase
    if input == "fight"
      take_turn("fight")
    elsif input == "heal"
      @current_player.heal
    else
      puts prompt
      input
    end  
  end
end

end




