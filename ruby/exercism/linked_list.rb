#!/usr/bin/env ruby

class Deque
  def initialize
    @queue = []
  end

  def push(node)
    @queue << node
  end

  def pop
    @queue.pop
  end

  def shift
    @queue.shift
  end

  def unshift(node)
    @queue.unshift(node)
  end

  def count
    @queue.size
  end

  def delete(node)
    @queue.delete_at(@queue.index(node)) if @queue.index(node)
  end
end