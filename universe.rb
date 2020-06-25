# frozen_string_literal: true

# Universo
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
