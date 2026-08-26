#!/usr/bin/env ruby

class BottleSong
  BOTTLES = {
    0 => 'no',
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten'
  }.map do |key, value|
    if key == 1
      [key, "#{value} green bottle"]
    else
      [key, "#{value} green bottles"]
    end
  end.to_h.freeze

  def self.recite(init, count)
    result = ''
    (1..count).each do
      result << <<~TEXT
        #{BOTTLES[init].capitalize} hanging on the wall,
        #{BOTTLES[init].capitalize} hanging on the wall,
        And if one green bottle should accidentally fall,
        There'll be #{BOTTLES[init - 1]} hanging on the wall.

      TEXT
      init -= 1
    end
    lines = result.lines
    lines.pop
    lines.join
  end
end