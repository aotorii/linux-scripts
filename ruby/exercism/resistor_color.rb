#!/usr/bin/env ruby

class ResistorColor
  BAND = {
    'black' => 0,
    'brown' => 1,
    'red' => 2,
    'orange' => 3,
    'yellow' => 4,
    'green' => 5,
    'blue' => 6,
    'violet' => 7,
    'grey' => 8,
    'white' => 9
  }.freeze

  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze

  def self.color_code(color)
    BAND[color]
  end
end