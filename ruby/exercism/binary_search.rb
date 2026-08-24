#!/usr/bin/env ruby

class BinarySearch
  def initialize(array)
    @arr = array
  end

  def search_for(element, left = 0, right = @arr.size - 1)
    return nil if left > right

    mid = (left + right) / 2
    if @arr[mid] == element
      mid
    elsif element < @arr[mid]
      search_for(element, left, mid - 1)
    else
      search_for(element, mid + 1, right)
    end
  end
end