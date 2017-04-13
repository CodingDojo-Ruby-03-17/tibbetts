require_relative 'project'


def with_captured_stdout
  begin
    old_stdout = $stdout
    $stdout = StringIO.new('','w')
    yield
    $stdout.string
  ensure
    $stdout = old_stdout
  end
end


RSpec.describe Project do
  before(:each) do
    # updated this block to create two projects
    @project1 = Project.new('Project 1', 'description 1')
    @project2 = Project.new('Project 2', 'description 2')
  end

  it 'has a getter and setter for name attribute' do
    @project1.name = "Changed Name" 
    expect(@project1.name).to eq("Changed Name") 
  end 

  it 'has a getter and setter for owner attriubute' do
    @project1.owner = "Kyle Tibbetts"
    expect(@project1.owner).to eq("Kyle Tibbetts")
  end

  it 'has a method elevator_pitch to explain name and description' do
    expect(@project1.elevator_pitch).to eq("Project 1, description 1")
    expect(@project2.elevator_pitch).to eq("Project 2, description 2")
  end

  it 'has a method add_task to add a new task on the task array' do
    expect(@project1.tasks).to eq([])
    todo = "Pass this test case"
    @project1.add_task(todo)
    expect(@project1.tasks).to eq([todo])
  end

  it 'has a method print_tasks to print all tasks in the task array' do
    @project1.add_task("Todo 1")
    @project1.add_task("Todo 2")
    @project1.add_task("Todo 3")
    outcome = with_captured_stdout { @project1.print_tasks }
    expected = @project1.tasks.join("\n") + "\n"
    expect(outcome).to eq(expected)
  end

end
