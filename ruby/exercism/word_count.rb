#!/usr/bin/env ruby

class Phrase
  def initialize(word)
    @word = word
  end

  def word_count
    count = {}
    @word.downcase.gsub(/[^a-z0-9']/, ' ').gsub(/\A'+|'\s|\s'|'+\z/, ' ').split.each do |w|
      if count.key?(w)
        count[w] += 1
      else
        count[w] = 1
      end
    end
    count
  end
end