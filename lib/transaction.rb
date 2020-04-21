require_relative 'account'

class Transaction

  attr_reader :deposit, :withdrawal

  def initialize
    # @balance = Account.balance
    @deposit = 0
    @withdrawal = 0
  end

  def make_deposit(amount)
    @deposit = amount
    # @balance += amount
  end

  def make_withdrawal(amount)
    @withdrawal = amount
    # @balance -= amount
  end
end
