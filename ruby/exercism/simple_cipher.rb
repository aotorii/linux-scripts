#!/usr/bin/env ruby

class Cipher
  NUMBERS = ('a'..'z').zip((0..25).to_a).to_h.freeze
  LETTERS = NUMBERS.invert.freeze

  def initialize(key = nil)
    key ||= Array.new(100) { ('a'..'z').to_a.sample }.join

    raise ArgumentError unless key.match?(/\A[a-z]+\z/)

    @key = key
  end

  def encode(text)
    text.chars.map.with_index { |c, i| LETTERS[(NUMBERS[c] + NUMBERS[@key.chars[i % @key.size]]) % 26] }.join
  end

  def decode(text)
    text.chars.map.with_index { |c, i| LETTERS[(NUMBERS[c] - NUMBERS[@key.chars[i % @key.size]]) % 26] }.join
  end

  attr_reader :key
end