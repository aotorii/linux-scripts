#!/usr/bin/env ruby

class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.split(':')[1].strip.gsub("\r\n", '').gsub("\n", '')
  end

  def log_level
    @line.split(':')[0][/\[(.*)\]/, 1].downcase
  end

  def reformat
    %{#{message} (#{log_level})}
  end
end
