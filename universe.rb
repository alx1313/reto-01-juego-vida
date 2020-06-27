# frozen_string_literal: true

# Universo
class Universe
  @planet = [[0, 1, 0, 1], [1, 0, 1, 0], [0, 1, 1, 0], [1, 0, 0, 1]]
  attr_accessor :north, :south, :east, :west, :total_neighbors

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
