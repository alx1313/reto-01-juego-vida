# frozen_string_literal: true

require './search_of_life.rb'
# Clase que detecta la vida en zonas especificas
class Detection
  Life.new
  def self.life_in_corners(cordx, cordy)
    if cordx.zero?
      Life.corner_top(cordx, cordy)
      Life.add_neighbors(cordx, cordy)
    elsif cordx == 3
      Life.corner_down(cordx, cordy)
    end
  end

  def self.life_in_sides(cordx, cordy)
    if cordy.zero?
      Life.side_east(cordx, cordy)
      Life.add_neighbors(cordx, cordy)
    elsif cordy == 3
      Life.side_west(cordx, cordy)
      Life.add_neighbors(cordx, cordy)
    end
  end

  def self.life_north_south(cordx, cordy)
    Life.side_updown(cordx, cordy)
    Life.add_neighbors(cordx, cordy)
  end

  def self.life_center(cordx, cordy)
    Universe.north(Universe.access_planet(cordx, cordy - 1))
    Universe.south(Universe.access_planet(cordx, cordy + 1))
    Universe.west(Universe.access_planet(cordx - 1, cordy))
    Universe.east(Universe.access_planet(cordx + 1, cordy))
    Life.add_neighbors(cordx, cordy)
  end
end
