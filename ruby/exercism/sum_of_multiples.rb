#!/usr/bin/env ruby

class SumOfMultiples
  def initialize(*items)
    @items = items
  end

  def to(level)
    multiples = []
    @items.each do |i|
      i.step(level, i) { |n| multiples << n if n < level } if i.positive?
    end
    multiples.uniq.sum
  end
end