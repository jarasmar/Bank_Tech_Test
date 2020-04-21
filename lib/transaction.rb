require_relative 'account'

class Transaction

  attr_reader :deposit, :withdrawal, :date

  def initialize
    # @balance = Account.balance
    @deposit = nil
    @withdrawal = nil
    @date = nil
  end

  def make_deposit(amount, balance)
    @deposit = amount
    save_date
    return { date: @date, deposit: @deposit, withdrawal: nil, balance: balance + amount }
  end

  def make_withdrawal(amount, balance)
    @withdrawal = amount
    save_date
    return { date: @date, deposit: nil, withdrawal: @withdrawal, balance: balance - amount }
  end

  def save_date
    @date = Time.new.strftime("%d/%m/%Y")
  end
end
