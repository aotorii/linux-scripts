#!/usr/bin/env ruby

class Allergies
  ITEMS = {
    0 => 'eggs',
    1 => 'peanuts',
    2 => 'shellfish',
    3 => 'strawberries',
    4 => 'tomatoes',
    5 => 'chocolate',
    6 => 'pollen',
    7 => 'cats'
  }.freeze

  def initialize(score)
    digit = 0
    list = []
    while score.positive? && digit < 8
      list << ITEMS[digit] unless (score % 2).zero?
      score /= 2
      digit += 1
    end
    @list = list
  end

  def allergic_to?(item)
    @list.include?(item)
  end

  attr_reader :list
end