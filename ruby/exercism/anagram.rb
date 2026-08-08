#!/usr/bin/env ruby

class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    target = @word.downcase.chars.sort
    words.select do |w|
      w = w.downcase
      w.chars.sort == target && w != @word.downcase
    end
  end
end