describe 'User Stories' do
  let(:bank) { Bank.new }
  let(:account) { Account.new }

  context 'deposit' do
    it 'can make a deposit in an account' do
      expect { bank.make_deposit(10, account) }.not_to raise_error
    end
  end

  context 'withdrawal' do
    it 'cant make a withdrawal if amout is bigger than balance' do
      expect { bank.make_withdrawal(10, account) }.to raise_error 'Insufficient balance in your account'
    end

    it 'can make a withdrawal from an account' do
      bank.make_deposit(10, account)
      expect { bank.make_withdrawal(5, account) }.not_to raise_error
    end
  end

  context 'statement' do
    it 'can print a bank statement' do
      expect { bank.print_statement(account) }.not_to raise_error
    end
  end
end
