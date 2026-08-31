#!/usr/bin/env ruby

class RotationalCipher
  NUMBERS = ('a'..'z').zip((0..25).to_a).to_h.freeze
  LETTERS = NUMBERS.invert.freeze

  def self.rotate(text, rot)
    text.chars.map do |c|
      if c.downcase.match?(/[a-z]/)
        c.match?(/[a-z]/) ? encode(c, rot) : encode(c.downcase, rot).upcase
      else
        c
      end
    end.join
  end

  def self.encode(char, rot)
    LETTERS[(NUMBERS[char] + rot) % 26]
  end
end