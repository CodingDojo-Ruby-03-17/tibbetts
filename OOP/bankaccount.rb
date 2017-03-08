class InsufficentFundsError < Exception
end


class BankAccount

  attr_reader :checkings, :savings, :total_accounts
  @@total_accounts = 0

  def initialize(checkings=0.0, savings=0.0)
    @account_number = generate_account_number
    @checkings = checkings
    @savings = savings
    @intrest_rate = 0.01
    @@total_accounts += 1
  end

  def deposit(amount, checkings=true)
    if checkings
      @checkings += amount.to_f.round(2)
    else
      @savings += amount.to_f.round(2)
    end
    return self
  end

  def withdraw(amount, checkings=true)
    if checkings
      if amount > @checkings
        raise InsufficentFundsError
      end
      @checkings -= amount.to_f.round(2)

    else
      if amount > @savings 
        raise InsufficentFundsError
      end
      @savings -= amount.to_f.round(2)

    end
    return self
  end

  def total
    return @savings + @checkings
  end

  def account_info
    puts @account_number
    puts "Intrest_rate = #{@intrest_rate}"
    puts "Checking -- #{@checkings}"
    puts "Savings  -- #{@savings}"
    puts "-------------------------------"
    puts "Total    -- #{total}"
  end

  def total_accounts
    puts @@total_accounts
  end

  private
    def generate_account_number
      return Array.new(24) { rand(0...9) }.join.to_i
    end
end



bank = BankAccount.new()
bank.total_accounts
bank.account_info
bank.deposit(100)
bank.account_info
bank.deposit(82.239333, false)
bank.account_info
bank.withdraw(99)
bank.account_info
#bank.withdraw(33)
b = BankAccount.new()
b.total_accounts
bank.total_accounts

