# frozen_string_literal: true

require './navigation.rb'
require './universe.rb'
# Paso completo por toda la matriz
class Loops
  Navigation.new
  def self.axis_loops
    [0, 1, 2, 3].each do |x|
      [0, 1, 2, 3].each do |y|
        Navigation.view(x, y)
      end
    end
    puts Universe.access_entire_planet
  end
end

Loops.new
Loops.axis_loops

