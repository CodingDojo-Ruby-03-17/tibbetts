require_relative 'project'


RSpec.describe Project do

  before(:each) do
    @project = Project.new("Name", "Description")
  end

  it "has a getter and setter for name attribute" do
    change = "Name Changed"
    @project.name = change
    expect(@project.name).to eq(change)
  end

  it "has a getter and setter for the description attribute" do
    change = "Description Changed"
    @project.description = change
    expect(@project.description).to eq(change)
  end

  it 'has a method elevator_pitch to explain name and description' do
    expect(@project.elevator_pitch).to eq("Name, Description")
  end

end

