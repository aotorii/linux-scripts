#!/usr/bin/env ruby

class Luhn
  def self.valid?(string)
    string = string.delete(' ').reverse
    if string.length == 1 || !string.match?(/\A[0-9]+\z/)
      false
    else
      (string.chars.map.with_index do |n, i|
        if i.odd?
          n = n.to_i * 2
          n > 9 ? (n - 9) : n
        else
          n.to_i
        end
      end.sum % 10).zero?
    end
  end
end