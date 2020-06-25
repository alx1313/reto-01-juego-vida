# frozen_string_literal: true

require 'search_of_life.rb'
# Clase que detecta la vida en zonas especificas
class Detection
  Life.new
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
