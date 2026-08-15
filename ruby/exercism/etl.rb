#!/usr/bin/env ruby

class ETL
  def self.transform(old)
    new = {}
    old.each do |k, v|
      new.merge!(v.map { |n| [n.downcase, k] }.to_h)
    end
    new.sort.to_h
  end
end