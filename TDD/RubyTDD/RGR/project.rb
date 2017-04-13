class Project

  attr_accessor :name, :description, :owner
  attr_reader :tasks

  def initialize(name, description, owner="")
    @name = name
    @description = description
    @owner = owner
    @tasks = []
  end

  def elevator_pitch
    "#{@name}, #{@description}"
  end

  def add_task(new_task)
    @tasks << new_task
    return # to avoid returning the tasks array
  end

  def print_tasks
    @tasks.each { |t| puts t }
    return 
  end

end

