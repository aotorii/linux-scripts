#!/usr/bin/env ruby

class BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if input_base <= 1
    raise ArgumentError if output_base <= 1
    raise ArgumentError if digits.any? { |n| n.negative? || n >= input_base }

    return [0] if digits.empty? || digits.all?(&:zero?)

    number = digits.reduce(0) do |sum, digit|
      sum * input_base + digit
    end
    size = Math.log(number, output_base).floor + 1
    (1..size).map do |i|
      n = number / output_base**(size - i)
      number %= output_base**(size - i)
      n
    end
  end
end