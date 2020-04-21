require 'statement'

describe Statement do

  let(:account_class) { double("account", trans_history: [{ :date => "20/04/2020", :deposit => '10.00', :withdrawal => nil, :balance => '10.00' }]) }

  subject(:stat) { described_class.new }

  it 'prints a statement' do
    expect(stat.print_statement(account_class.trans_history)).to include '20/04/2020 || 10.00 ||  || 10'
  end

end
