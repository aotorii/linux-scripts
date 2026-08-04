#!/usr/bin/env ruby

class Pangram
  def self.pangram?(sentence)
    ('a'..'z').all? { |c| sentence.downcase.include?(c) }
  end
end