require 'bank'

describe Bank do

  let(:account_class) { double(:account) }

  subject(:bank) { described_class.new }

  # it 'can make a deposit on an account' do
  #   expect(account_class).to receive(:make_deposit).with(10).once
  #   bank.make_deposit(10, bank.account)
  # end
  #
  # it 'can make a withdrawal from an account' do
  #   expect(account_class).to receive(:make_withdrawal).with(5).once
  #   bank.make_deposit(10, bank.account)
  #   bank.make_withdrawal(5, bank.account)
  # end
end
