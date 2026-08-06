#!/usr/bin/env ruby

class Squares
  def initialize(length)
    @length = length
  end

  def square_of_sum
    (1..@length).sum**2
  end

  def sum_of_squares
    (1..@length).sum { |n| n**2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end