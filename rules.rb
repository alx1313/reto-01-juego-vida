# frozen_string_literal: true

load 'universe.rb'
# lo que dice el comentario de arriba
class Rules
  Universe.new
  def self.reaper_rules(reaper, cordx, cordy)
    if reaper > 3
      Universe.change_life(0, cordx, cordy)
    else
      Universe.change_life(1, cordx, cordy)
    end
  end

  def self.rule_1(cordx, cordy)
    if Universe.access_planet(cordx, cordy) == 1
      Universe.change_life(1, cordx, cordy)
      puts Universe.access_entire_planet
    elsif Universe.access_planet(cordx, cordy).zero?
      Universe.change_life(1, cordx, cordy)
      puts Universe.access_entire_planet
    end
  end

  def self.rule_2(cordx, cordy)
    if Universe.access_planet(cordx, cordy) == 1
      Universe.change_life(1, cordx, cordy)
      puts Universe.access_entire_planet
    elsif Universe.access_planet(cordx, cordy).zero?
      Universe.change_life(0, cordx, cordy)
      puts Universe.access_entire_planet
    end
  end

  def self.rule_3(cordx, cordy)
    Universe.change_life(0, cordx, cordy)
    puts Universe.access_entire_planet
  end

  def self.alive_rules(mercy, cordx, cordy)
    if mercy == 3
      Rules.rule_1(cordx, cordy)
    elsif mercy == 2
      Rules.rule_2(cordx, cordy)
    elsif mercy <= 1
      Rules.rule_3(cordx, cordy)
    end
  end
end
