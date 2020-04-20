describe 'User Stories' do
  let(:account) { Account.new }

  context 'deposit' do
    it 'can make a deposit in an account' do
      expect { account.deposit(10) }.not_to raise_error
    end
  end

  context 'withdrawal' do
    it 'can make a withdrawal from an account' do
      expect { account.withdrawal }.not_to raise_error
    end
  end
end
