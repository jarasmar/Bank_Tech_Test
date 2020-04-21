require 'transaction'

describe Transaction do

  subject(:trans) { described_class.new }

  context '#deposit' do
    it { is_expected.to respond_to :make_deposit }

    it 'takes a deposit amount' do
      trans.make_deposit(10)
      expect(trans.deposit).to eq 10
    end
  end

  context '#withdrawal' do
    it { is_expected.to respond_to :make_withdrawal }

    it 'takes a withdrawal amount' do
      trans.make_withdrawal(5)

      expect(trans.withdrawal).to eq 5
    end
  end
end
