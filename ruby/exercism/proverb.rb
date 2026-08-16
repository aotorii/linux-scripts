#!/usr/bin/env ruby

class Proverb
  def initialize(*chain, qualifier: '')
    @chain = chain
    @qualifier = qualifier
  end

  def to_s
    result = []
    (1...@chain.length).each do |i|
      result << "For want of a #{@chain[i - 1]} the #{@chain[i]} was lost."
    end
    result << "And all for the want of a #{@qualifier} #{@chain[0]}." unless @chain.empty?
    result.join("\n").gsub(/ {2,}/, ' ')
  end
end