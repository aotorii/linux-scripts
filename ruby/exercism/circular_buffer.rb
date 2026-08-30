#!/usr/bin/env ruby

class CircularBuffer
  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

  def initialize(length)
    @buffer = Array.new(length)
    @oldest = @newest = nil
    @length = length
  end

  def read
    raise BufferEmptyException if @buffer.all?(&:nil?)

    result = @buffer[@oldest]
    @buffer[@oldest] = nil
    @newest, @oldest = @buffer.all?(&:nil?) ? [nil, nil] : [@newest, next_pos(@oldest)]
    result
  end

  def write(element)
    unless @oldest
      @oldest = @newest = 0
      @buffer[@oldest] = element
      return self
    end
    if @buffer.any?(nil)
      @newest = next_pos(@newest)
      @buffer[@newest] = element
      return self
    end
    raise BufferFullException
  end

  def write!(element)
    write(element)
  rescue BufferFullException
    @newest = @oldest
    @oldest = next_pos(@oldest)
    @buffer[@newest] = element
    self
  end

  def clear
    @buffer.fill(nil)
    @oldest = @newest = nil
  end

  def next_pos(index)
    (index + 1) % @length
  end
end