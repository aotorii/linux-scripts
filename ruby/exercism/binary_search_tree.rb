#!/usr/bin/env ruby

class Bst
  include Enumerable

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(data)
    if data <= @data
      @left ? @left.insert(data) : @left = Bst.new(data)
    else
      @right ? @right.insert(data) : @right = Bst.new(data)
    end
  end

  def each(&block)
    return enum_for(:each) unless block

    @left&.each(&block)
    yield @data
    @right&.each(&block)
  end

  attr_reader :data, :left, :right
end