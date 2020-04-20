class Account

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdrawal(amount)
    raise 'Insufficient balance in your account' if amount > @balance

    @balance -= amount
  end
end
