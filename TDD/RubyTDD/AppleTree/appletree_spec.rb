require_relative 'appletree'

RSpec.describe AppleTree do
  before(:each) do
    @tree = AppleTree.new()
  end

  it 'has an age with getter and setter' do
    @tree.age = 100
    expect(@tree.age).to eq(100)
  end

  it 'has a height attribute with a getter' do
    expect{ @tree.height }.not_to raise_error(NoMethodError)
    expect{ @tree.height = 100 }.to raise_error(NoMethodError)
  end

  it 'has an apple count attribute, no setter' do
    expect{ @tree.apples }.not_to raise_error(NoMethodError)
    expect{ @tree.apples = 1 }.to raise_error(NoMethodError)
  end

  it 'has a year_gone_by' do 
    expect{ @tree.years_gone_by }.not_to raise_error(NoMethodError)
  end

  context 'years_gone_by before age 3' do
    it 'does not grow apples the first 3 years of its life' do
      for year in [1..3]
        age = @tree.age
        height = @tree.height
        @tree.years_gone_by(1)
        expect(@tree.apples).to eq(0)
        expect(@tree.age).to eq(age+1)
        expect(@tree.height).to eq(height*1.10)
      end

    end
  end

  context 'years_gone_by age 3-10' do
    before do
      @tree.years_gone_by(2) # tree is age 3
    end
    it 'tree grows apples in years from 3-10' do

    end
  end

  context 'years_gone_by age older than 10' do
    it '' do

    end
  end

  it 'has pick_apples method to remove all apples' do
    @tree.years_gone_by(10)
    @tree.pick_apples()
    expect(@tree.apples).to eq(0)
  end

  it 'does not grow apples when over 10' do
    @tree.years_gone_by(10)
    apples = @tree.apples
    @tree.years_gone_by(1000)
    expect(@tree.apples).to eq(apples)
  end

end

