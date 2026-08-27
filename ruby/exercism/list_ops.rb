#!/usr/bin/env ruby

class ListOps
  def self.arrays(array)
    array.sum { 1 }
  end

  def self.reverser(array)
    result = []
    arrays(array).times do
      result << array.pop
    end
    result
  end

  def self.concatter(array_1, array_2)
    array_2.each do |c|
      array_1 << c
    end
    array_1
  end

  def self.mapper(array)
    result = []
    array.each do |c|
      result << yield(c)
    end
    result
  end

  def self.filterer(array, &block)
    result = []
    array.each do |c|
      result << c if block.call(c)
    end
    result
  end

  def self.sum_reducer(array)
    result = 0
    array.each do |c|
      result += c
    end
    result
  end

  def self.factorial_reducer(array)
    result = 1
    array.each do |c|
      result *= c
    end
    result
  end
end