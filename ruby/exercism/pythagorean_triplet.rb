#!/usr/bin/env ruby

class PythagoreanTriplet
  def self.triplets_with_sum(sum)
    triplets = []
    (1..sum).each do |a|
      ((a + 1)..(sum - a)).each do |b|
        c = sum - a - b
        triplets << [a, b, c] if b < c && a**2 + b**2 == c**2
      end
    end
    triplets
  end
end