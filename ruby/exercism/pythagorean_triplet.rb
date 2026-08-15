#!/usr/bin/env ruby

class PythagoreanTriplet
  def self.triplets_with_sum(sum)
    triplets = []
    scale = 1 - 1 / Math.sqrt(2)
    (1..(sum * scale).floor).each do |a|
      b = sum * (sum / 2.0 - a) / (sum - a)
      c = sum - a - b
      triplets << [a, b.to_i, c.to_i] if (b % 1).zero?
    end
    triplets
  end
end