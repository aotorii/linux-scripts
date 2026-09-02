#!/usr/bin/env ruby

class PrimeFactors
  def self.of(num)
    result = []
    divisor = 2
    while divisor * divisor <= num
      while (num % divisor).zero?
        result << divisor
        num /= divisor
      end
      divisor = divisor.even? ? (divisor + 1) : (divisor + 2)
    end
    result << num if num > 1
    result
  end
end