require_relative 'account'

class Transaction

  attr_reader :deposit, :withdrawal, :date

  def initialize
    @deposit = nil
    @withdrawal = nil
    @date = nil
  end

  def make_deposit(amount, balance)
    @deposit = add_decimals(amount)
    current_balance = add_decimals(balance + amount)
    save_date
    return { date: @date, deposit: @deposit, withdrawal: nil, balance: current_balance }
  end

  def make_withdrawal(amount, balance)
    @withdrawal = add_decimals(amount)
    current_balance = add_decimals(balance - amount)
    save_date
    return { date: @date, deposit: nil, withdrawal: @withdrawal, balance: current_balance }
  end

  def save_date
    @date = Time.new.strftime("%d/%m/%Y")
  end

  private

  def add_decimals(number)
    # formats integer to two decimals
    "%.2f" % number
  end
end
