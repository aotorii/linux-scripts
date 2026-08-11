#!/usr/bin/env ruby

class Transpose
  def self.transpose(str)
    matrix = str.split("\n").map(&:chars)
    len = matrix.map(&:length).max
    matrix.map { |r| r.fill(nil, r.length...len) }.transpose.map do |r|
      r.pop while r[-1].nil?
      r.map { |c| c.nil? ? ' ' : c }.join
    end.join("\n")
  end
end