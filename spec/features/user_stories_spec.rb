describe 'User Stories' do
  let(:account) { Account.new }

  context 'deposit' do
    it 'can make a deposit in an account' do
      expect { account.deposit }.not_to raise_error
    end
  end
end
