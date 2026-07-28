#!/usr/bin/env ruby

class Hamming
  def self.compute(strand_1, strand_2)
    raise ArgumentError if strand_1.length != strand_2.length

    count = 0
    (0...strand_1.length).each { |n| count += 1 unless strand_1[n] == strand_2[n] }
    count
  end
end