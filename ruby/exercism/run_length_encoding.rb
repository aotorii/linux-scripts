#!/usr/bin/env ruby

class RunLengthEncoding
  def self.encode(text)
    result = ''
    chars = []

    text.chars.each do |c|
      if chars.any? && c != chars.last
        result << (chars.size == 1 ? chars.last : "#{chars.size}#{chars.last}")
        chars = []
      end
      chars << c
    end
    unless chars.empty?
      result << (chars.size == 1 ? chars.last : "#{chars.size}#{chars.last}")
    end
    result
  end

  def self.decode(text)
    result = ''
    count = 0
    text.chars.each do |c|
      if c.match?(/[0-9]/)
        count = count * 10 + c.to_i
      elsif count.zero?
        result << c
      else
        result << c * count
        count = 0
      end
    end

    result
  end
end