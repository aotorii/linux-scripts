#!/usr/bin/env ruby

class ResistorColorDuo
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

  def self.value(color)
    color[..1].each_with_index.map { |c, i| BAND[c] * 10**(1 - i) }.sum
  end
end
