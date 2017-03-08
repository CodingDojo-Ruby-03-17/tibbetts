require_relative 'mammal'

class Dog < Mammal

  def pet
    @health += 5
    return self
  end

  def walk
    @health -= 1 unless @health == 0
    return self
  end

  def run
    @health -= 10 unless @health < 10
    return self
  end

end
dog = Dog.new(1)
# dog.display_health
dog.walk.walk.walk.walk.pet
dog.display_health
