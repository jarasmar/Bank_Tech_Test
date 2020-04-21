require 'transaction'

describe Transaction do

  subject(:trans) { described_class.new }

  context '#deposit' do
    it { is_expected.to respond_to :make_deposit }

    it 'takes a deposit amount' do
      trans.make_deposit(10, 0)
      expect(trans.deposit).to eq 10
    end
  end

  context '#withdrawal' do
    it { is_expected.to respond_to :make_withdrawal }

    it 'takes a withdrawal amount' do
      trans.make_withdrawal(5, 10)

      expect(trans.withdrawal).to eq 5
    end
  end

  context '#date' do
    it 'saves the date of a transaction' do
      # stub date
      @date = Time.parse('20/04/2020')
      Time.stub(:new).and_return(@date)

      trans.save_date
      expect(trans.date).to eq '20/04/2020'
    end
  end
end
