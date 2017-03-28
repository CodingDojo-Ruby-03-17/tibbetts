require_relative 'bankaccount'

=begin
  1st and 2nd raise warnings. Get code reviewed, and ask for alternatives
  for all tests.
=end

RSpec.describe BankAccount do
  before(:each) do 
    @bank = BankAccount.new()
  end

  it 'has attr getter .checkings' do
    expect{ @bank.checkings }.to_not raise_error(NoMethodError)     
  end

  it 'has method to get account total' do
    expect{ @bank.total() }.not_to raise_error(NoMethodError)     
  end

  it 'has method to withdraw cash' do
    @bank.deposit(100) # depends on if deposit funcitonality is working
    @bank.withdraw(100)
    expect(@bank.checkings).to eq(0.0)
  end

  it 'raises an error when user tries to withdraw too much' do
    expect{ @bank.withdraw(2 ** 64) }.to raise_error(InsufficentFundsError)
  end

  it 'raise an error when the user attempts to retieve the total number of bank accounts' do
    expect{ @bank.total_accounts }.to raise_error(NoMethodError)
  end

  it 'raises error when user attempts to set interest rate' do
    expect{ @bank.interest_rate = 1 }.to raise_error(NoMethodError)
  end

end
