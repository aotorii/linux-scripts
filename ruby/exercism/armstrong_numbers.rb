#!/usr/bin/env ruby

module ArmstrongNumbers
  def self.include?(number)
    str = number.to_s
    digit = str.length
    number == str.chars.map { |c| c.to_i**digit }.sum
  end
end
