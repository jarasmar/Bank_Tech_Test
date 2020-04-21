require 'bank'

describe Bank do

  let(:account_class) { double(:account) }

  subject(:bank) { described_class.new(account_class) }

  it 'can make a deposit on an account' do
    expect(account_class).to receive(:make_deposit).once
    bank.make_deposit(10, bank.account)
  end

  it 'can make a withdrawal from an account' do
    expect(account_class).to receive(:make_withdrawal).once
    bank.make_withdrawal(5, bank.account)
  end

  it 'can print an statement from an account' do
    expect(account_class).to receive(:generate_stat)
    bank.print_statement(bank.account)
  end
end
