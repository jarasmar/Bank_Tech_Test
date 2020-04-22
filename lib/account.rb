require_relative 'transaction'
require_relative 'statement'

class Account

  attr_reader :balance, :transaction_history

  def initialize(transaction = Transaction.new, statement = Statement.new)
    @balance = 0
    @transaction_history = []
    @transaction = transaction
    @statement = statement
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

  def print_statement
    statement = @statement.generate_statement(@transaction_history)
    puts statement
  end
end
