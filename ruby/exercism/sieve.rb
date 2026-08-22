#!/usr/bin/env ruby

class Sieve
  def initialize(num)
    @num = num
  end

  def primes
    result = []
    array = (2..@num).to_a
    prime = 2
    while prime <= Math.sqrt(@num)
      result << prime
      array -= (prime**2).step(@num, prime).to_a
      array.delete(prime)
      prime = array.min
    end
    result + array
  end
end