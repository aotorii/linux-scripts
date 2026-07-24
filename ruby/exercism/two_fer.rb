#!/usr/bin/env ruby

class TwoFer
  def self.two_fer(name = '')
    case name
    when ''
      'One for you, one for me.'
    else
      "One for #{name}, one for me."
    end
  end
end

