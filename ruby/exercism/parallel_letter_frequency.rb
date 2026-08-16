#!/usr/bin/env ruby

require 'etc'

class ParallelLetterFrequency
  def self.count(texts)
    return {} if texts.empty?

    worker_count = [Etc.nprocessors, texts.length].min
    chunks = texts.each_slice(
      (texts.length.to_f / worker_count).ceil
    ).to_a
    ractors = chunks.map do |chunk|
      Ractor.new(chunk) do |texts|
        result = Hash.new(0)
        texts.each do |text|
          text.downcase.each_char do |char|
            result[char] += 1 if char.match?(/\p{L}/)
          end
        end
        result
      end
    end
    count = Hash.new(0)
    ractors.each do |ractor|
      ractor.take.each do |char, frequency|
        count[char] += frequency
      end
    end
    count
  end
end