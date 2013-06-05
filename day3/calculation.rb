class Calculation
  def initialize(operand1, operand2, operator = '+' )
    @operand1 = operand1
    @operand2 = operand2
    @operator = operator
  end

  def result
    case @operator
    when '+'
      @operand1 + @operand2
    when '-'
      @operand1 - @operand2
    when '*'
      @operand1 * @operand2
    when '/'
      @operand1 / @operand2
    else
      p "Error!"
    end
  end
end
