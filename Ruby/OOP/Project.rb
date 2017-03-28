class Project
  
  def initialize(name, description)
    @name = name
    @description = description
  end

  def elevator_pitch
    puts "#{@name}: #{@description}"
  end

end


