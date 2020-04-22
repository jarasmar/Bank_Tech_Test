describe 'User Stories' do
  # let(:bank) { Bank.new }
  let(:account) { Account.new }

  before do
    # stub time for consistent testing
    @date = Time.parse('20/04/2020')
    Time.stub(:new).and_return(@date)
  end

  context 'deposit' do
    it 'can make a deposit in an account' do
      expect { account.make_deposit(10) }.not_to raise_error
    end

    it 'adds deposit amount to balance' do
      account.make_deposit(10)
      expect(account.balance).to eq 10
    end

    it 'adds a movement to transaction history' do
      account.make_deposit(10)
      expect(account.transaction_history).to include({ :date => "20/04/2020", :deposit => '10.00', :withdrawal => nil, :balance => '10.00' })
    end
  end

  context 'withdrawal' do
    it 'cant make a withdrawal if amout is bigger than balance' do
      expect { account.make_withdrawal(10) }.to raise_error 'Insufficient balance in your account'
    end

    it 'can make a withdrawal from an account' do
      account.make_deposit(10)
      expect { account.make_withdrawal(5) }.not_to raise_error
    end

    it 'deducts deposit amount from balance' do
      account.make_deposit(10)
      account.make_withdrawal(5)
      expect(account.balance).to eq 5
    end

    it 'adds a movement to transaction history' do
      account.make_deposit(10)
      account.make_withdrawal(5)
      expect(account.transaction_history).to include({ :date => "20/04/2020", :deposit => nil, :withdrawal => '5.00', :balance => '5.00' })
    end
  end

  context 'statement' do
    it 'can print a bank statement' do
      expect { account.print_statement }.not_to raise_error
    end

    it 'prints a bank statement in reverse chronological order' do
      account.make_deposit(10)
      account.make_withdrawal(5)
      expect { account.print_statement }.to output("date       || credit || debit || balance\n20/04/2020 ||  || 5.00 || 5.00\n20/04/2020 || 10.00 ||  || 10.00\n").to_stdout
    end
  end
end
