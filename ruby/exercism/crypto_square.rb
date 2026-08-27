#!/usr/bin/env ruby

class Crypto
  def initialize(text)
    text = text.downcase.gsub(/[^0-9a-z]/, '')
    length = text.size
    if length.zero?
      @ciphertext = ''
    else
      col = Math.sqrt(length).ceil
      row = (length / col.to_f).ceil
      @ciphertext = (text + ' ' * (row * col - length)).chars.each_slice(col).to_a.transpose.map(&:join).join(' ')
    end

  end

  attr_reader :ciphertext
end