require_relative 'transaction'

class Account

  attr_reader :balance

  def initialize
    @balance = 0
    @trans = Transaction.new
  end

  def make_deposit(amount)
    @trans.make_deposit(amount)
    @balance += amount
  end

  def make_withdrawal(amount)
    raise 'Insufficient balance in your account' if amount > @balance

    @trans.make_withdrawal(amount)
    @balance -= amount
  end
end
