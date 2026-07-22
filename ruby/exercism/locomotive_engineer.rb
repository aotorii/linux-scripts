#!/usr/bin/env ruby

class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons)
    wagons
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    a, b, c, *wagons = each_wagons_id
    [c, *missing_wagons, *wagons, a, b]
  end

  def self.add_missing_stops(from_to, **stops)
    { **from_to, stops: stops.values }
  end

  def self.extend_route_information(route, more_route_information)
    { **route, **more_route_information }
  end
end
