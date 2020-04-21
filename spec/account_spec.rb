require 'account'

describe Account do
  subject(:account) { described_class.new }

  context '#initialize' do
    it 'balance is 0' do
      expect(account.balance).to eq 0
    end

    it 'transaction history is empty' do
      expect(account.trans_history).to eq []
    end
  end

  context '#deposit' do
    it { is_expected.to respond_to :make_deposit }

    it 'adds deposit amount to balance' do
      account.make_deposit(10)
      expect(account.balance).to eq 10
    end
  end

  context '#withdrawal' do
    it { is_expected.to respond_to :make_withdrawal }

    it 'raises an error if not enough balance' do
      expect { account.make_withdrawal(10) }.to raise_error 'Insufficient balance in your account'
    end

    it 'deducts withdrawal amount from balance' do
      account.make_deposit(10)
      account.make_withdrawal(5)

      expect(account.balance).to eq 5
    end
  end
end
