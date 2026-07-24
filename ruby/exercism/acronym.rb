#!/usr/bin/env ruby

class Acronym
  def self.abbreviate(words)
    words.delete('_').gsub('-', ' ').split.map { |w| w[0].upcase }.join
  end
end