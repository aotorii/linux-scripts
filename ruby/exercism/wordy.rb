#!/usr/bin/env ruby

class WordProblem
  def initialize(question)
    rule = /\AWhat is -?\d+( (?:divided by|plus|minus|multiplied by) -?\d+)*\?\z/
    raise ArgumentError unless question.match?(rule)

    @question = question
  end

  def answer
    question = @question.gsub(/\AWhat is |\?\z/, '').split(/ by | /)
    result = question.shift.to_i
    operation = []
    question.each do |n|
      if operation.empty?
        operation << n
        next
      end
      n = n.to_i
      case operation.pop
      when 'plus'
        result += n
      when 'minus'
        result -= n
      when 'multiplied'
        result *= n
      when 'divided'
        result /= n
      end
    end
    result
  end
end