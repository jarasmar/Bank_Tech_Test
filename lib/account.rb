require_relative 'transaction'

class Account

  attr_reader :balance, :trans_history

  def initialize
    @balance = 0
    @trans_history = []
    @trans = Transaction.new
  end

  def make_deposit(amount)
    @trans_history << @trans.make_deposit(amount, @balance)
    @balance += amount
  end

  def make_withdrawal(amount)
    raise 'Insufficient balance in your account' if amount > @balance

    @trans_history << @trans.make_withdrawal(amount, @balance)
    @balance -= amount
  end
end
