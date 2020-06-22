# object where life "exists"
class Universe
  @planet = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
  attr_accessor :north, :south, :east, :west

  def acp(cordx, cordy)
    @planet[cordx][cordy]
  end

  def chl(life, cordx, cordy)
    @planet[cordx][cordy] = life
  end

  def access_entire_planet
    @planet
  end
end
# rules of the game of life
class Rules
  Universe.new
  def reaper_rules(reaper, cordx, cordy)
    if reaper > 3
      Universe.chl(0, cordx, cordy)
    else
      Universe.chl(1, cordx, cordy)
    end
  end

  def rule_1(cordx, cordy)
    if Universe.acp(cordx, cordy) == 1
      Universe.chl(1, cordx, cordy)
      puts Universe.access_entire_planet 
    elsif Universe.acp(cordx, cordy).zero?
      Universe.chl(1, cordx, cordy)
      puts Universe.access_entire_planet
    end
  end

  def rule_2(cordx, cordy)
    if Universe.acp(cordx, cordy) == 1
      Universe.chl(1, cordx, cordy)
      puts Universe.access_entire_planet
    elsif Universe.acp(cordx, cordy).zero?
      Universe.chl(0, cordx, cordy)
      puts Universe.access_entire_planet
    end
  end

  def rule_3(cordx, cordy)
    Universe.chl(0, cordx, cordy)
    puts Universe.access_entire_planet
  end

  def alive_rules(mercy, cordx, cordy)
    if mercy == 3
      Rules.rule_1(cordx, cordy)
    elsif mercy == 2
      Rules.rule_2(cordx, cordy)
    elsif mercy <= 1
      Rules.rule_3(cordx, cordy)
    end
  end
end

try_stone = Rules.new
puts try_stone.alive_rules(1, 0, 0)
