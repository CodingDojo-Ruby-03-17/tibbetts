class MathDojo

  attr_reader :result
  
  def initialize()
    @result = 0
    return self
  end

  def add *operands
    @result += operands.reduce(:+)
    return self
  end

  def sub *operands
    @result -= operands.reduce(:+)
    return self
  end
end

#puts MathDojo.new().add(1,2,3,4).sub(-90).result
