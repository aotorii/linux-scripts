#!/usr/bin/env ruby

# Write your code for the 'D&D Character' exercise in this file. Make the tests in
# `dnd_character_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/dnd-character` directory.

class DndCharacter
  def self.modifier(value)
    ((value - 10) / 2).floor
  end

  def initialize
    abilities = []
    6.times do
      ability = Array.new(4) { rand(1..6) }.max(3).sum
      abilities << ability
    end
    @strength = abilities[0]
    @dexterity = abilities[1]
    @constitution = abilities[2]
    @intelligence = abilities[3]
    @wisdom = abilities[4]
    @charisma = abilities[5]
    @modifier = ((@constitution - 10) / 2).floor
  end

  def hitpoints
    @hitpoints = 10 + @modifier
  end

  attr_reader :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma
end