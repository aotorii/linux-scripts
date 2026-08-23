#!/usr/bin/env ruby

class PerfectNumber
  def self.classify(num)
    raise ArgumentError, 'Classification is only possible for positive integers.' unless num.positive?

    aliquot_sum = (1..Math.sqrt(num).floor).filter { |n| (num % n).zero? }.flat_map { |n| [n, num / n] }.uniq.sum - num
    if aliquot_sum < num
      'deficient'
    elsif aliquot_sum == num
      'perfect'
    elsif aliquot_sum > num
      'abundant'
    end
  end
end