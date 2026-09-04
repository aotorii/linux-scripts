#!/usr/bin/env ruby

class CustomSet
  def initialize(list)
    @set = list.uniq.sort
  end

  attr_reader :set

  def include?(element)
    @set.include?(element)
  end

  def empty?
    @set.empty?
  end

  def ==(other)
    @set == other.set
  end

  def member?(element)
    @set.include?(element)
  end

  def subset?(other)
    @set.all? { |e| other.include?(e) }
  end

  def disjoint?(other)
    @set.none? { |e| other.include?(e) }
  end

  def add(element)
    @set << element unless include?(element)
    @set.sort!
    self
  end

  def intersection(other)
    CustomSet.new(@set.select { |e| other.include?(e) })
  end

  def difference(other)
    CustomSet.new(@set.reject { |e| other.include?(e) })
  end

  def union(other)
    CustomSet.new(@set + other.set)
  end
end