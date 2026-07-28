#!/usr/bin/env ruby

class Series
  def initialize(str)
    raise ArgumentError if str == ''

    @str = str
  end

  def slices(length)
    str_length = @str.length
    raise ArgumentError if length <= 0 || length > str_length

    strs = []
    (0..(str_length - length)).each { |n| strs << @str[n, length] }
    strs
  end
end