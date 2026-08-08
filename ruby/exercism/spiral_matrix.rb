#!/usr/bin/env ruby

class SpiralMatrix
  def initialize(order)
    matrix = Array.new(order) { Array.new(order) }
    top = 0
    bottom = order - 1
    left = 0
    right = order - 1

    i = 1
    while top <= bottom && left <= right
      (left..right).each do |c|
        matrix[top][c] = i
        i += 1
      end
      top += 1
      (top..bottom).each do |r|
        matrix[r][right] = i
        i += 1
      end
      right -= 1
      if top <= bottom
        right.downto(left) do |c|
          matrix[bottom][c] = i
          i += 1
        end
        bottom -= 1
      end
      next unless left <= right

      bottom.downto(top) do |r|
        matrix[r][left] = i
        i += 1
      end
      left += 1
    end
    @matrix = matrix
  end

  attr_reader :matrix
end