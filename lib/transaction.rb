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
    # formats integer to two decimals
    @deposit = ("%.2f" % amount)
    save_date
    current_balance = "%.2f" % (balance + amount)
    return { date: @date, deposit: @deposit, withdrawal: nil, balance: current_balance }
  end

  def make_withdrawal(amount, balance)
    @withdrawal = ("%.2f" % amount)
    save_date
    current_balance = "%.2f" % (balance - amount)
    return { date: @date, deposit: nil, withdrawal: @withdrawal, balance: current_balance }
  end

  def save_date
    @date = Time.new.strftime("%d/%m/%Y")
  end
end
