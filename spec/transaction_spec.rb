require 'transaction'

describe Transaction do

  subject(:transaction) { described_class.new }

  context '#deposit' do
    it { is_expected.to respond_to :make_deposit }

    it 'takes a deposit amount' do
      transaction.make_deposit(10, 0)
      expect(transaction.deposit).to eq '10.00'
    end
  end

  context '#withdrawal' do
    it { is_expected.to respond_to :make_withdrawal }

    it 'takes a withdrawal amount' do
      transaction.make_withdrawal(5, 10)

      expect(transaction.withdrawal).to eq '5.00'
    end
  end

  context '#date' do
    it 'saves the date of a transaction' do
      # stub date
      @date = Time.parse('20/04/2020')
      Time.stub(:new).and_return(@date)

      transaction.save_date
      expect(transaction.date).to eq '20/04/2020'
    end
  end
end
