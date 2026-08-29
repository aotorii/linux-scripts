#!/usr/bin/env ruby

class Change
  class ImpossibleCombinationError < StandardError
  end

  class NegativeTargetError < StandardError
  end

  def self.generate(coins, amount)
    raise NegativeTargetError if amount.negative?

    change = lambda do |amount, memo = {}|
      return [] if amount.zero?

      return memo[amount] if memo.key?(amount)

      best = nil
      coins.each do |coin|
        next if coin > amount

        result = change.call(amount - coin, memo)
        next if result.nil?

        candidate = (result + [coin]).sort
        best = candidate if best.nil? || candidate.size < best.size
      end
      memo[amount] = best
    end

    result = change.call(amount)
    raise ImpossibleCombinationError if result.nil?

    result
  end
end