#!/usr/bin/env ruby

class Grid
  def self.saddle_points(grid)
    points = []
    grid.each_with_index do |r, i|
      r.each_with_index do |n, j|
        points << { 'row' => i + 1, 'column' => j + 1 } if n == r.max && n == grid.map { |r| r[j] }.min
      end
    end
    points
  end
end