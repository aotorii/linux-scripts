#!/usr/bin/env ruby

class Affine
  NUMBERS = ('a'..'z').zip((0..25).to_a).to_h.freeze
  LETTERS = NUMBERS.invert.freeze

  def initialize(a, b)
    raise ArgumentError if a.gcd(26) > 1

    @a = a
    @b = b
    @inv = (1..25).find { |x| (a * x) % 26 == 1 }
  end

  def encode(text)
    text.downcase.gsub(/[^0-9a-z]/, '').chars.map { |c| cipher(c) }.each_slice(5).map(&:join).join(' ')
  end

  def decode(char)
    char.delete(' ').chars.map { |c| decipher(c) }.join
  end

  def cipher(char)
    char.match?(/[a-z]/) ? LETTERS[(@a * NUMBERS[char] + @b) % 26] : char
  end

  def decipher(char)
    char.match?(/[a-z]/) ? LETTERS[(@inv * (NUMBERS[char] - @b)) % 26] : char
  end
end