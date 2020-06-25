require 'universe.rb'
require 'rules.rb'
# caracteristicas especiales de cada 'area' donde se aloja la vida
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
end
