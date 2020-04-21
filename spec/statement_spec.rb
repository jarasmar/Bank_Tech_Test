require 'statement'

describe Statement do

  let(:account_class) { double("account", trans_history: [{ :date => "20/04/2020", :deposit => '10.00', :withdrawal => nil, :balance => '10.00' }, { :date => "22/04/2020", :deposit => nil, :withdrawal => '5.00', :balance => '5.00' }]) }

  subject(:stat) { described_class.new }

  it 'generates a statement' do
    expect(stat.generate_stat(account_class.trans_history)).to include '20/04/2020 || 10.00 ||  || 10.00'
  end

  it 'statement is in reverse chronological order' do
    expect(stat.generate_stat(account_class.trans_history)).to include "22/04/2020 ||  || 5.00 || 5.00\n20/04/2020 || 10.00 ||  || 10.00"
  end

end
