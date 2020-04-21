require_relative 'transaction'
require_relative 'statement'

class Account

  attr_reader :balance, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = []
    @transaction = Transaction.new
    @statement = Statement.new
  end

  def make_deposit(amount)
    @transaction_history << @transaction.make_deposit(amount, @balance)
    @balance += amount
  end

  def make_withdrawal(amount)
    raise 'Insufficient balance in your account' if amount > @balance

    @transaction_history << @transaction.make_withdrawal(amount, @balance)
    @balance -= amount
  end

  def generate_statement
    @statement.generate_statement(@transaction_history)
  end
end
