#!/usr/bin/env ruby

class Clock
  def initialize(hour: 0, minute: 0)
    @minute = (hour * 60 + minute) % 1440
  end

  attr_reader :minute

  def +(other)
    self.class.new(minute: @minute + other.minute)
  end

  def -(other)
    self.class.new(minute: @minute - other.minute)
  end

  def ==(other)
    @minute == other.minute
  end

  def to_s
    hour = (@minute / 60).floor
    minute = @minute % 60
    "#{format('%02d', hour)}:#{format('%02d', minute)}"
  end
end