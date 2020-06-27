# frozen_string_literal: true

require './life_detection.rb'
# Scann each zone to detect life
class Navigation
  Life.new
  def self.axis_x_one(travel_x, travel_y)
    if travel_y.positive? && travel_y < 3
      Detection.life_in_sides(travel_x, travel_y)
    else
      Detection.life_in_corners(travel_x, travel_y)
    end
  end

  def self.axis_x_inside(travel_x, travel_y)
    if travel_y.positive? && travel_y < 3
      Detection.life_in_center(travel_x, travel_y)
    else
      Detection.life_north_south(travel_x, travel_y)
    end
  end

  def self.axis_x_last(travel_x, travel_y)
    if travel_y.positive? && travel_y < 3
      Detection.life_in_sides(travel_x, travel_y)
    else
      Detection.life_in_corners(travel_x, travel_y)
    end
  end

  def self.x_view(travel_x, travel_y)
    travel_x.each do
      Navigation.y_view(travel_x, travel_y)
    end
  end

  def self.y_view(travel_x, travel_y)
    travel_y.each do
      case travel_x
      when 0
        Navigation.axis_x_first(travel_x, travel_y)   
      when 1..2
        Navigation.axis_x_inside(travel_x, travel_y)
      when 3
        Navigation.axis_x_last(travel_x, travel_y)
      end
    end
  end
end
