#!/usr/bin/env ruby

class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    number = @speed * 221.0
    if @speed.between?(1, 4)
      number
    elsif @speed.between?(5, 8)
      number * 0.9
    elsif @speed == 9
      number * 0.8
    elsif @speed == 10
      number * 0.77
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
