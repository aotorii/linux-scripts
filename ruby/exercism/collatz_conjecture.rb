#!/usr/bin/env ruby

class CollatzConjecture
  def self.steps(num)
    raise ArgumentError unless num.positive?

    i = 0
    while num > 1
      num = if num.even?
              num / 2
            else
              3 * num + 1
            end
      i += 1
    end
    i
  end
end