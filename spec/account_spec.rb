require 'account'

describe Account do
  subject(:account) { described_class.new }

  context '#initialize' do
    it 'balance is 0' do
      expect(account.balance).to eq 0
    end
  end

  context '#deposit' do
    it { is_expected.to respond_to :deposit }

    it 'adds deposit amount to balance' do
      account.deposit(10)
      expect(account.balance).to eq 10
    end
  end

  context '#withdrawal' do
    it { is_expected.to respond_to :withdrawal }

    it 'deducts withdrawal amount from balance' do
      expect { account.withdrawal(10) }.to raise_error 'Insufficient balance in your account'
    end
  end
end
