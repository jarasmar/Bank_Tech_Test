# require_relative 'account'
#
# class Bank
#
#   attr_reader :account
#
#   def initialize(account = Account.new)
#     @account = account
#   end
#
#   def make_deposit(amount, account)
#     account.make_deposit(amount)
#   end
#
#   def make_withdrawal(amount, account)
#     account.make_withdrawal(amount)
#   end
#
#   def print_statement(account)
#     statement = account.generate_statement
#     puts statement
#   end
# end
