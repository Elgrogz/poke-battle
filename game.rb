require_relative('player')
require_relative('pokemon')
require('pry-byebug')

class Game
attr_reader :pokemon_list, :current_player, :winner, :name, :hit_points
  def initialize
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
      puts @pokemon_list[1].hit_points
      win_check
  end

  def heal
    if @current_player.hit_points > 90
      @current_player.hit_points = 100
    else
      @current_player.hit_points += 10
    end
  end


  def win_check
    for poke in @pokemon_list
      if poke.hit_points <= 0
       @pokemon_list.pop
       win
      end
    end
  end

  def win
    @winner = @pokemon_list[0]
    puts "#{@winner.name} is the winner!"
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






