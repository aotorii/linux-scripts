#!/usr/bin/env ruby

class ResistorColorTrio
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

  PREFIX = {
    0..2 => '',
    3..5 => 'kilo',
    6..8 => 'mega',
    9..11 => 'giga'
  }.freeze

  def initialize(color)
    @color = color
  end

  def label
    ohms = (BAND[@color[0]] * 10 + BAND[@color[1]]) * 10**BAND[@color[2]]
    return 'Resistor value: 0 ohms' if ohms.zero?

    PREFIX.each do |k, v|
      if k.include?(Math.log10(ohms).floor)
        ohms = "#{ohms / 10**k.to_a[0]} #{v}ohms"
        break
      end
    end
    "Resistor value: #{ohms}"
  end
end