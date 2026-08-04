#!/usr/bin/env ruby

class Complement
  RULES = {
    'A' => 'U',
    'T' => 'A',
    'C' => 'G',
    'G' => 'C'
  }.freeze

  def self.of_dna(dna)
    dna.chars.map { |n| RULES[n] }.join
  end
end