#!/usr/bin/env ruby

class Bob
  PATTERN = {
    /\A(?=.*[A-Z])(?!.*[a-z]).*\?\s*\z/m => "Calm down, I know what I'm doing!",
    /\A.*\?\s*\z/m => 'Sure.',
    /\A(?=.*[A-Z])(?!.*[a-z]).*\z/m => 'Whoa, chill out!',
    /\A\s*\z/m => 'Fine. Be that way!'
  }.freeze

  def self.hey(remark)
    PATTERN.each do |reg, answer|
      return answer if remark.match?(reg)
    end
    'Whatever.'
  end
end