#!/usr/bin/env ruby

class Palindromes
  def initialize(max_factor:, min_factor: 1)
    raise ArgumentError, 'min must be <= max' if min_factor > max_factor

    @max = max_factor
    @min = min_factor
  end

  def generate
    @smallest = Palindrome.new(*find_smallest)
    @largest = Palindrome.new(*find_largest)
    self
  end

  def find_largest
    largest = [nil, []]
    @max.downto(@min) do |i|
      break if largest[0] && i * i < largest[0]

      i.downto(@min) do |j|
        product = i * j
        break if largest[0] && product < largest[0]
        next unless palindrome?(product)

        largest = normalize(product) if largest[0].nil? || product > largest[0]
      end
    end
    largest
  end

  def find_smallest
    smallest = [nil, []]
    @min.upto(@max) do |i|
      break if smallest[0] && i * i > smallest[0]

      i.upto(@max) do |j|
        product = i * j
        break if smallest[0] && product > smallest[0]
        next unless palindrome?(product)

        smallest = normalize(product) if smallest[0].nil? || product < smallest[0]
      end
    end
    smallest
  end

  def normalize(number)
    factors = []
    (@min..[Math.sqrt(number).floor, @max].min).each do |i|
      factors << [i, number / i] if (number % i).zero? && number / i <= @max
    end
    [number, factors]
  end

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end

  attr_reader :smallest, :largest
end

class Palindrome
  def initialize(value, factors)
    @value = value
    @factors = factors
  end

  attr_reader :value, :factors
end