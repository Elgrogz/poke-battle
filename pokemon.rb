class Pokemon

  attr_accessor :hit_points
  attr_reader :name

  def initialize(name, type)
    @name = name 
    @type = type
    #need to figure out damage done
    @abilities = {tackle: 20}
    @hit_points = 100
  end

  def return_pokemon_name
    return @name
  end

  def return_hit_points
    return @hit_points
  end

end