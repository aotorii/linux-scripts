#!/usr/bin/env ruby

class TwoBucket
  def initialize(size_1, size_2, goal, initial)
    size = { 'one' => size_1, 'two' => size_2 }
    status = {}
    moves = 1

    pour = lambda do |from, to|
      if status[from] > size[to] - status[to]
        status[from] = status[from] - size[to] + status[to]
        status[to] = size[to]
      else
        status[to] = status[from] + status[to]
        status[from] = 0
      end
      moves += 1
    end

    empty = lambda do |from|
      status[from] = 0
      moves += 1
    end

    fill = lambda do |to|
      status[to] = size[to]
      moves += 1
    end

    case initial
    when 'one'
      if size_1 == goal
        @moves = 1
        @goal_bucket = 'one'
        @other_bucket = 0
        return
      elsif size_2 == goal
        @moves = 2
        @goal_bucket = 'two'
        @other_bucket = size_1
        return
      end
      status = { 'one' => size_1, 'two' => 0 }
      pour.call('one', 'two')
    when 'two'
      if size_1 == goal
        @moves = 2
        @goal_bucket = 'one'
        @other_bucket = size_2
        return
      elsif size_2 == goal
        @moves = 1
        @goal_bucket = 'two'
        @other_bucket = 0
        return
      end
      status = { 'one' => 0, 'two' => size_2 }
      pour.call('two', 'one')
    end

    until status.values.include?(goal)
      filled_bucket = status.keys.find { |k| status[k] == size[k] }
      empty_bucket = status.keys.find { |k| status[k].zero? }
      if filled_bucket
        if filled_bucket == initial
          other = (status.keys - [filled_bucket]).first
          pour.call(filled_bucket, other)
          next
        end
        empty.call(filled_bucket)
        next
      end
      if empty_bucket == initial
        fill.call(empty_bucket)
        next
      end
      other = (status.keys - [empty_bucket]).first
      pour.call(other, empty_bucket)
    end

    @moves = moves
    @goal_bucket = status.keys.find { |k| status[k] == goal }
    @other_bucket = status[(status.keys - [@goal_bucket]).first]
  end

  attr_reader :moves, :goal_bucket, :other_bucket
end