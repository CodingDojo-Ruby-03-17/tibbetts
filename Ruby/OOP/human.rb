class Human

  def initialize(health=100, strength=3, intelligence=3, stealth=3)
    @health = health
    @strength = strength
    @intelligence = intelligence
    @stealth = stealth
  end

  def display_human
    puts "Health       #{@health}"
    puts "Strength     #{@strength}"
    puts "Intelligence #{@intelligence}"
    puts "Stealth      #{@stealth}"
  end

  def attack human
    puts human.class.ancestors
    if human.class.ancestors.include? Human 
       human.hit rand(20...40) # unless human.dead?
    end
  end
  
  def hit damage
    @health -= damage
  end

  def dead?
    return @health <= 0
  end

end

kyle = Human.new()
kyle.display_human
sam = Human.new()
while !sam.dead? 
  kyle.attack(sam)
end
sam.display_human

