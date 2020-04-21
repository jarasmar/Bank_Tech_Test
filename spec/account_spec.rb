require 'account'

describe Account do
  subject(:account) { described_class.new }

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
      expect(account.trans_history).to eq []
    end
  end

  context '#deposit' do
    it { is_expected.to respond_to :make_deposit }

    it 'adds deposit amount to balance' do
      account.make_deposit(10)
      expect(account.balance).to eq 10
    end

    it 'adds a movement to transaction history' do
      account.make_deposit(10)

      expect(account.trans_history).to include({ :date => "20/04/2020", :deposit => '10.00', :withdrawal => nil, :balance => '10.00' })
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

    it 'adds a movement to transaction history' do
      account.make_deposit(10)
      account.make_withdrawal(5)

      expect(account.trans_history).to include({ :date => "20/04/2020", :deposit => nil, :withdrawal => '5.00', :balance => '5.00' })
    end
  end

  context '#statement' do
    it 'prints an statement' do
      account.make_deposit(10)
      expect(account.generate_stat).to include '20/04/2020 || 10.00 ||  || 10'
    end
  end
end
