#!/usr/bin/env ruby

class Series
  def initialize(series)
    raise ArgumentError unless series.match(/\A\d+\z/)

    @series = series
  end

  def largest_product(span)
    raise ArgumentError if span > @series.size || !span.positive?

    @series.chars.map(&:to_i).each_cons(span).map { |x| x.reduce(:*) }.max
  end
end