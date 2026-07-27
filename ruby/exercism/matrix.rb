#!/usr/bin/env ruby

class Matrix
  def initialize(data)
    @matrix = data.split("\n").map { |row| row.split.map(&:to_f) }
  end

  def row(index)
    @matrix[index - 1]
  end

  def column(index)
    @matrix.map { |row| row.at(index - 1) }
  end
end