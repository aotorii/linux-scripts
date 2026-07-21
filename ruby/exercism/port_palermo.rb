#!/usr/bin/env ruby

module Port
  # TODO: define the 'IDENTIFIER' constant
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city[0, 4].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    item = ship_identifier.to_s.downcase
    if item.start_with?('oil') || item.start_with?('gas')
      :A
    else
      :B
    end
  end
end
