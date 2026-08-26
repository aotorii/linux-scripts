#!/usr/bin/env ruby

class Robot
  DIRECTION = %i[east north west south].freeze

  def orient(direction)
    raise ArgumentError unless DIRECTION.include?(direction)

    @bearing = direction
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def turn_right
    @bearing = DIRECTION[(DIRECTION.index(@bearing) - 1) % 4]
  end

  def turn_left
    @bearing = DIRECTION[(DIRECTION.index(@bearing) + 1) % 4]
  end

  def advance
    case @bearing
    when :east
      @coordinates[0] += 1
    when :west
      @coordinates[0] -= 1
    when :north
      @coordinates[1] += 1
    when :south
      @coordinates[1] -= 1
    end
  end

  attr_reader :bearing, :coordinates
end

class Simulator
  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def instructions(order)
    result = []
    order.chars.each do |i|
      case i
      when 'L'
        result << :turn_left
      when 'R'
        result << :turn_right
      when 'A'
        result << :advance
      end
    end
    result
  end

  def evaluate(robot, order)
    instructions(order).each { |i| robot.public_send(i) }
  end
end