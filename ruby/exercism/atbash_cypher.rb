#!/usr/bin/env ruby

class Atbash
  CIPHER = ('a'..'z').zip(('a'..'z').to_a.reverse).to_h.freeze

  def self.encode(text)
    text.downcase.gsub(/[^0-9a-z]/, '').chars.map { |c| cipher(c) }.each_slice(5).map(&:join).join(' ')
  end

  def self.decode(text)
    text.delete(' ').chars.map { |c| cipher(c) }.join
  end

  def self.cipher(char)
    return CIPHER[char] if ('a'..'z').include?(char)

    char
  end

  private_class_method :cipher
end