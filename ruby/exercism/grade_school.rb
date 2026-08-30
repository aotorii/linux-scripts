#!/usr/bin/env ruby

class School
  def initialize
    @roster = Hash.new { |h, k| h[k] = [] }
  end

  def roster
    @roster.sort_by(&:first).map { |list| list.last.sort }.flatten
  end

  def add(name, grade)
    if @roster.values.flatten.include?(name)
      false
    else
      !!(@roster[grade] << name)
    end
  end

  def grade(grade)
    @roster[grade].sort
  end
end