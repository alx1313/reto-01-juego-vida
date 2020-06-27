# Object where life "exists"
class Universe
  @planet = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
  attr_accessor :north, :south, :east, :west, :total_neighbors

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
# Search life
class Life
  Rules.new
  Universe.new
  def add_neighbors
    Universe.total_neighbors = Universe.north + Universe.south + Universe.east + Universe.west 
  end

  def corner_top(cordx, cordy)
    Universe.north = Universe.acp(cordx + 3, cordy)
    Universe.south = Universe.acp(cordx + 1, cordy)
    if cordy.zero?
      Universe.west = Universe.acp(cordx, cordy + 3)
      Universe.east = Universe.acp(cordx, cordy + 1)
    elsif cordy == 3
      Universe.west = Universe.acp(cordx, cordy - 1)
      Universe.east = Universe.acp(cordx, cordy - 3)
    end
  end

  def corner_down(cordx, cordy)
    Universe.north = Universe.acp(cordx - 1, cordy)
    Universe.south = Universe.acp(cordx - 3, cordy)
    if cordy.zero?
      Universe.west = Universe.acp(cordx, cordy + 3)
      Universe.east = Universe.acp(cordx, cordy + 1)
    elsif cordy == 3
      Universe.west = Universe.acp(cordx, cordy - 1)
      Universe.east = Universe.acp(cordx, cordy - 3)
    end
  end

  def side_west(cordx, cordy)
    Universe.north = Universe.acp(cordx, cordy + 1)
    Universe.south = Universe.acp(cordx, cordy + 1)
    if cordx.zero?
      Universe.east = Universe.acp(cordx + 1, cordy)
      Universe.west = Universe.acp(cordx + 3, cordy)
    elsif cordx == 3
      Universe.east = Universe.acp(cordx - 3, cordy)
      Universe.west = Universe.acp(cordx - 1, cordy)
    end
  end

  def side_updown(cordx, cordy)
    Universe.west = Universe.acp(cordx - 1, cordy)
    Universe.east = Universe.acp(cordx + 1, cordy)
    if cordy.zero?
      Universe.north = Universe.acp(cordx, cordy + 3)
      Universe.south = Universe.acp(cordx, cordy + 1)
    elsif cordy == 3
      Universe.north = Universe.acp(cordx, cordy - 1)
      Universe.south = Universe.acp(cordx, cordy - 3)
    end
  end

  def life_in_corners(cordx, cordy)
    if cordx.zero?
      Life.corner_top(cordx, cordy)
      Life.add_neighbors
    elsif cordx == 3
      Life.corner_down(cordx, cordy)
      Life.add_neighbors
    else
      break
    end
  end

  def life_in_sides(cordx, cordy)
    if cordy.zero?
      Life.side_east(cordx, cordy)
      Life.add_neighbors
    elsif cordy == 3
      Life.side_west(cordx, cordy)
      Life.add_neighbors
    else
      break
    end
  end

  def life_north_south(cordx, cordy)
    if cordy.zero?
      Life.side_up(cordx, cordy)
      Life.add_neighbors
    elsif cordy == 3
      Life.side_down(cordx, cordy)
      Life.add_neighbors
    end
  end

  def life_center(cordx, cordy)
    Universe.north = Universe.acp(cordx, cordy - 1)
    Universe.south = Universe.acp(cordx, cordy + 1)
    Universe.west = Universe.acp(cordx - 1, cordy)
    Universe.east = Universe.acp(cordx + 1, cordy)
    Life.add_neighbors
  end
end
