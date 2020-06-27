# frozen_string_literal: true

# Universo
class Universe
  @planet = [
    [0, 1, 0, 1],
    [1, 0, 1, 0],
    [0, 1, 1, 0],
    [1, 0, 0, 1]]
  @north = 0
  @south = 0
  @east = 0
  @west = 0
  @total_neighbors = 0

  def self.north(north)
    @north = north
  end

  def self.r_north
    @north
  end

  def self.south(south)
    @south = south
  end

  def self.r_south
    @south
  end

  def self.east(east)
    @east = east
  end

  def self.r_east
    @east
  end

  def self.west(west)
    @west = west
  end

  def self.r_west
    @west
  end

  def self.total_neighbors(north, south, east, west)
    if r_total_neighbors == 0
      @total_neighbors = north, south, east, west
    else
      @total_neighbors = 0
    end
  end

  def self.r_total_neighbors
    @total_neighbors
  end

  def self.access_planet(cordx, cordy)
    @planet[cordx][cordy]
  end

  def self.change_life(life, cordx, cordy)
    @planet[cordx][cordy] = life
  end

  def self.access_entire_planet
    @planet
  end
end
