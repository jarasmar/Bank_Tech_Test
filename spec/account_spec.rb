require 'account'

describe Account do
  context '#deposit' do
    it { is_expected.to respond_to :deposit }
  end
end
