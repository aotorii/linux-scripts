#!/usr/bin/env ruby

class FlowerField
  def self.annotate(input)
    rows = input.size
    cols = input.first&.size || 0
    result = Array.new(rows) { Array.new(cols) }
    input.each_with_index do |r, i|
      r.chars.each_with_index do |c, j|
        if c == '*'
          result[i][j] = c
          next
        end
        count = input[[i - 1, 0].max...[i + 2, rows].min].map { |row| row[[j - 1, 0].max...[j + 2, cols].min].chars }.flatten.count('*')
        result[i][j] = count.positive? ? count : ' '
      end
    end
    result.map(&:join)
  end
end