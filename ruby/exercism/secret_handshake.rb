#!/usr/bin/env ruby

class SecretHandshake
  ACTIONS = ['wink', 'double blink', 'close your eyes', 'jump'].freeze

  def initialize(code)
    result = []
    5.times do |i|
      if code.odd?
        if i < 4
          result << ACTIONS[i]
        else
          result.reverse!
        end
      end
      code /= 2
    end
    @commands = result
  end

  attr_reader :commands
end