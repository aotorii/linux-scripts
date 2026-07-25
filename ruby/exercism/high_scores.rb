#!/usr/bin/env ruby

class HighScores
  def initialize(scores)
    @scores = scores
  end

  attr_reader :scores

  def latest
    @scores.last
  end

  def personal_best
    @scores.max
  end

  def personal_top_three
    @scores.max(3).sort { |a, b| b <=> a }
  end

  def latest_is_personal_best?
    latest == personal_best
  end
end