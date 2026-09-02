#!/usr/bin/env ruby

class Garden
  PLANTS = {
    'G' => :grass,
    'C' => :clover,
    'R' => :radishes,
    'V' => :violets
  }.freeze

  STUDENTS = %i[alice bob charlie david eve fred ginny harriet ileana joseph kincaid larry].freeze

  def initialize(plants)
    @plants = plants.split("\n")
  end

  STUDENTS.each.with_index do |name, index|
    define_method(name) do
      @plants.map { |row| row[(2 * index)..(2 * index + 1)].chars.map { |plant| PLANTS[plant] } }.flatten
    end
  end
end