#!/usr/bin/env ruby

class Alphametics
  def self.solve(puzzle)
    left, right = puzzle.split(/\s*==\s*/)
    left = left.split(/\s*\+\s*/)
    words = left + [right]
    leading = words.map(&:chars).map(&:first).uniq

    columns = []
    max_len = words.map(&:length).max
    max_len.times do |i|
      adders = left.map do |w|
        w[-1 - i]
      end.compact
      r = right[-1 - i]
      columns << [adders, r]
    end

    solutions = []

    search = lambda do |index, values, used, carry|
      return if solutions.size >= 2

      if index == columns.size
        return unless carry.zero?

        solutions << values.dup
        return
      end

      adders, right_char = columns[index]
      needed = (adders + [right_char]).compact.uniq
      unknown = needed.reject { |c| values.key?(c) }
      assign = lambda do |idx|
        if idx == unknown.size
          sum = carry
          adders.each do |c|
            sum += values[c]
          end
          digit = sum % 10
          new_carry = sum / 10
          search.call(index + 1, values, used, new_carry) if values[right_char] == digit
          return
        end
        c = unknown[idx]
        (0..9).each do |n|
          next if used.include?(n)
          next if n.zero? && leading.include?(c)

          values[c] = n
          used << n
          assign.call(idx + 1)
          used.delete(n)
          values.delete(c)
        end
      end
      assign.call(0)
    end
    search.call(0, {}, [], 0)

    solutions.size == 1 ? solutions.first : {}
  end
end