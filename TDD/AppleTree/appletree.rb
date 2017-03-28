class AppleTree

  attr_accessor :age
  attr_reader :height, :apples

  def initialize()
    @age = 0
    @height = 1
    @apples = 0 
  end

  def years_gone_by(years=1)
    for year in [0..years]
      @height *= 1.10
      @apples += 2 unless (@age > 10 || @age < 3)
      @age += 1
    end
  end

  def pick_apples()
    @apples = 0
    return
  end

end
