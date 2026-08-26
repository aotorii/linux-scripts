#!/usr/bin/env ruby

class RailFenceCipher
  def self.pattern(length, layer)
    row = 0
    dir = 1
    Array.new(length) do
      r = row
      row += dir
      dir *= -1 if row.zero? || row == layer - 1
      r
    end
  end

  def self.encode(text, layer)
    return text if layer == 1

    rails = Array.new(layer) { [] }
    pattern(text.size, layer).each_with_index do |row, i|
      rails[row] << text[i]
    end
    rails.join
  end

  def self.decode(text, layer)
    return text if layer == 1

    pattern = pattern(text.size, layer)
    counts = pattern.tally.values
    chars = []
    index = 0
    counts.each_with_index do |count, row|
      chars[row] = text[index, count].chars
      index += count
    end
    pattern.map { |row| chars[row].shift }.join
  end
end