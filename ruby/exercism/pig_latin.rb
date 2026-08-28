#!/usr/bin/env ruby

class PigLatin
  def self.translate(words)
    words.split.map do |word|
      case word
      when /\A(?:[aeiou]|xr|yt)/
        prefix = ''
      when /\A[^aeiou]*qu/
        prefix = word[/\A[^aeiou]*qu/]
      when /\A[^aeiouy]+y/
        prefix = word[/\A[^aeiouy]+/]
      when /\A[^aeiou]+/
        prefix = word[/\A[^aeiou]+/]
      end
      suffix = "#{prefix}ay"
      word.delete_prefix!(prefix)
      word << suffix
    end.join(' ')
  end
end