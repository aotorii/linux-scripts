#!/usr/bin/env ruby

class Brackets
  PAIR = { '}' => '{', ')' => '(', ']' => '[' }.freeze
  def self.paired?(string)
    string = string.gsub(/[^()\[\]{}]/, '')
    left = []

    string.chars.each do |c|
      if '({['.include?(c)
        left << c
        next
      end
      return false if left.pop != PAIR[c]
    end
    return false unless left.empty?

    true
  end
end