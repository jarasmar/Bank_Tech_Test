require 'account'

describe Account do

  let(:transaction_class) { double(:transaction) }
  let(:statement_class) { double(:statement) }

  subject(:account) { described_class.new(transaction_class, statement_class) }

  before do
    # stub time for consistent testing
    @date = Time.parse('20/04/2020')
    Time.stub(:new).and_return(@date)
  end

  context '#initialize' do
    it 'balance is 0' do
      expect(account.balance).to eq 0
    end

    it 'transaction history is empty' do
      expect(account.transaction_history).to eq []
    end
  end

  context '#deposit' do
    it { is_expected.to respond_to :make_deposit }

    it 'adds deposit amount to balance' do
      expect(transaction_class).to receive(:make_deposit).once
      account.make_deposit(10)
      expect(account.balance).to eq 10
    end

    it 'adds a movement to transaction history' do
      expect(transaction_class).to receive(:make_deposit).and_return({ :date => "20/04/2020", :deposit => '10.00', :withdrawal => nil, :balance => '10.00' })
      account.make_deposit(10)

      expect(account.transaction_history).to include({ :date => "20/04/2020", :deposit => '10.00', :withdrawal => nil, :balance => '10.00' })
    end
  end

  context '#withdrawal' do
    it { is_expected.to respond_to :make_withdrawal }

    it 'raises an error if not enough balance' do
      expect { account.make_withdrawal(10) }.to raise_error 'Insufficient balance in your account'
    end

    it 'deducts withdrawal amount from balance' do
      expect(transaction_class).to receive(:make_deposit).once
      expect(transaction_class).to receive(:make_withdrawal).once
      account.make_deposit(10)
      account.make_withdrawal(5)

      expect(account.balance).to eq 5
    end

    it 'adds a movement to transaction history' do
      expect(transaction_class).to receive(:make_deposit).once
      expect(transaction_class).to receive(:make_withdrawal).and_return({ :date => "20/04/2020", :deposit => nil, :withdrawal => '5.00', :balance => '5.00' })
      account.make_deposit(10)
      account.make_withdrawal(5)

      expect(account.transaction_history).to include({ :date => "20/04/2020", :deposit => nil, :withdrawal => '5.00', :balance => '5.00' })
    end
  end

  context '#statement' do
    it 'prints an statement' do
      expect(transaction_class).to receive(:make_deposit).and_return({ :date => "20/04/2020", :deposit => '10.00', :withdrawal => nil, :balance => '10.00' })
      expect(statement_class).to receive(:generate_statement).with([{ :date => "20/04/2020", :deposit => '10.00', :withdrawal => nil, :balance => '10.00' }])
      account.make_deposit(10)
      account.print_statement
    end
  end
end
