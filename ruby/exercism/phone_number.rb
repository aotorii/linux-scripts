#!/usr/bin/env ruby

class PhoneNumber
  def self.clean(number)
    number = number.gsub(/\A\+|[()\-\s.]/, '')
    return unless number.match?(/\A1?[2-9]\d{2}[2-9]\d{6}\z/)

    number.delete_prefix('1')
  end
end