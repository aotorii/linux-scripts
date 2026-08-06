#!/usr/bin/env ruby

class SpaceAge
  PLANET_YEARS = {
    'Mercury' => 0.2408467,
    'Venus' => 0.61519726,
    'Earth' => 1.0,
    'Mars' => 1.8808158,
    'Jupiter' => 11.862615,
    'Saturn' => 29.447498,
    'Uranus' => 84.016846,
    'Neptune' => 164.79132
  }.freeze

  def initialize(seconds)
    @age = seconds.to_f / 31_557_600
  end

  PLANET_YEARS.each do |planet, year|
    define_method("on_#{planet}") do
      @age / year
    end
  end
end