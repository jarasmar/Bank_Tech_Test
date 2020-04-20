describe 'User Stories' do
  let(:account) { Account.new }

  context 'deposit' do
    it 'can make a deposit in an account' do
      expect { account.deposit(10) }.not_to raise_error
    end
  end

  context 'withdrawal' do
    it 'cant make a withdrawal if amout is bigger than balance' do
      expect { account.withdrawal(10) }.to raise_error 'Insufficient balance in your account'
    end

    it 'can make a withdrawal from an account' do
      account.deposit(10)
      expect { account.withdrawal(5) }.not_to raise_error
    end
  end
end
