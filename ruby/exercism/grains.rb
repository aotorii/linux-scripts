#!/usr/bin/env ruby

class Grains
  def self.square(num)
    case num
    when 1..64
      2**(num - 1)
    else
      raise ArgumentError
    end
  end

  def self.total
    2**64 - 1
  end
end