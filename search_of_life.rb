# frozen_string_literal: true

require './universe.rb'
require './rules.rb'
# caracteristicas especiales de cada 'area' donde se aloja la vida
class Life
  Rules.new
  Universe.new
 
  def self.corner_top(cordx, cordy)
    Universe.north(Universe.access_planet(cordx + 3, cordy))
    Universe.south(Universe.access_planet(cordx + 1, cordy))
    if cordy.zero?
      Universe.west(Universe.access_planet(cordx, cordy + 3))
      Universe.east(Universe.access_planet(cordx, cordy + 1))
    elsif cordy == 3
      Universe.west(Universe.access_planet(cordx, cordy - 1))
      Universe.east(Universe.access_planet(cordx, cordy - 3))
    end
  end

  def self.corner_down(cordx, cordy)
    Universe.north(Universe.access_planet(cordx - 1, cordy))
    Universe.south(Universe.access_planet(cordx - 3, cordy))
    if cordy.zero?
      Universe.west(Universe.access_planet(cordx, cordy + 3))
      Universe.east(Universe.access_planet(cordx, cordy + 1))
    elsif cordy == 3
      Universe.west(Universe.access_planet(cordx, cordy - 1))
      Universe.east(Universe.access_planet(cordx, cordy - 3))
    end
  end

  def self.side_west(cordx, cordy)
    Universe.north(Universe.access_planet(cordx, cordy + 1))
    Universe.south(Universe.access_planet(cordx, cordy + 1))
    if cordx.zero?
      Universe.east(Universe.access_planet(cordx + 1, cordy))
      Universe.west(Universe.access_planet(cordx + 3, cordy))
    elsif cordx == 3
      Universe.east(Universe.access_planet(cordx - 3, cordy))
      Universe.west(Universe.access_planet(cordx - 1, cordy))
    end
  end

  def self.side_updown(cordx, cordy)
    Universe.west(Universe.access_planet(cordx - 1, cordy))
    Universe.east(Universe.access_planet(cordx + 1, cordy))
    if cordy.zero?
      Universe.north(Universe.access_planet(cordx, cordy + 3))
      Universe.south(Universe.access_planet(cordx, cordy + 1))
    elsif cordy == 3
      Universe.north(Universe.access_planet(cordx, cordy - 1))
      Universe.south(Universe.access_planet(cordx, cordy - 3))
    end
  end

  def self.add_neighbors(cordx, cordy)
    Universe.total_neighbors(Universe.r_north, Universe.r_south, Universe.r_east, Universe.r_west)
    Rules.reaper_rules(Universe.r_total_neighbors, cordx, cordy)
  end
end
