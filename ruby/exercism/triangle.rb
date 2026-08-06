#!/usr/bin/env ruby

class Triangle
  def initialize(triangle)
    @triangle = triangle
  end

  def legal?
    @triangle.map.with_index { |l, i| @triangle[i - 2] + @triangle[i - 1] >= l && l.positive? }.all?
  end

  def test
    @triangle.map.with_index { |l, i| l - @triangle[i - 1] }
  end

  def equilateral?
    legal? && test.all?(&:zero?)
  end

  def isosceles?
    legal? && test.any?(&:zero?)
  end

  def scalene?
    legal? && !isosceles?
  end
end