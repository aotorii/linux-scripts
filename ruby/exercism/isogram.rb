#!/usr/bin/env ruby

class Isogram
  def self.isogram?(input)
    input = input.delete('- ').downcase
    input.length == input.chars.uniq.join.length
  end
end