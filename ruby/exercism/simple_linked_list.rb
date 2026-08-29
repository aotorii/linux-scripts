#!/usr/bin/env ruby

class Element
  def initialize(datum)
    @datum = datum
    @next = nil
  end

  attr_accessor :next
  attr_reader :datum
end

class SimpleLinkedList
  def initialize(array = [])
    @list = array.to_a.reverse.map { |e| Element.new(e) }
  end

  def push(element)
    @list.unshift(element)
    self
  end

  def pop
    @list.shift
  end

  def to_a
    @list.map(&:datum)
  end

  def reverse!
    @list.reverse!
    self
  end
end