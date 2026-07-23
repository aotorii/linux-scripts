#!/usr/bin/env ruby

class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)

    raise UnsupportedOperation, "Unsupported Operation #{operation}" unless ALLOWED_OPERATIONS.include?(operation)
    raise ArgumentError, 'Argument Error.' if !first_operand.is_a?(Numeric) || !second_operand.is_a?(Numeric)

    case operation
    when '+'
      "#{first_operand} + #{second_operand} = #{first_operand + second_operand}"
    when '/'
      if second_operand.zero?
        'Division by zero is not allowed.'
      else
        "#{first_operand} / #{second_operand} = #{first_operand / second_operand}"
      end
    when '*'
      "#{first_operand} * #{second_operand} = #{first_operand * second_operand}"
    end
  end
end
