#!/usr/bin/env ruby

class EliudsEggs
  def self.egg_count(decimal)
    decimal.to_s(2).count('1')
  end
end