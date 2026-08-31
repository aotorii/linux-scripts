#!/usr/bin/env ruby

class Integer
  VALUES = {
    1000 => 'M',
    500 => 'D',
    100 => 'C',
    50 => 'L',
    10 => 'X',
    5 => 'V',
    1 => 'I'
  }.freeze

  def to_roman
    number = self
    result = ''
    i = 1
    4.times do
      j = number % 10
      result = if ((j + 1) % 5).zero?
                 "#{VALUES[i]}#{VALUES[(j + 1) * i]}#{result}"
               else
                 "#{(VALUES[5 * i] || '') * (j / 5)}#{VALUES[i] * (j % 5)}#{result}"
               end
      number /= 10
      i *= 10
    end
    result
  end
end