class Account

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdrawal(*)
    raise 'Insufficient balance in your account'
  end
end
