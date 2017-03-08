require_relative 'mammal'

class Lion < Mammal

  def initialize health=170
    super health
  end

  def fly
    @health -= 10 unless @health < 10
    return self
  end

  def attack_tower
    @health -= 50 unless @health < 50
    return self
  end

  def eat_humans
    @health += 20
    return self
  end

  def display_health
    puts 'This is a lion'
    super
  end
end

lion = Lion.new(9)
lion.fly.display_health
