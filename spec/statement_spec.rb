require 'statement'

describe Statement do

  subject(:stat) { described_class.new }

  it 'prints a statement' do
    expect(stat.print_statement).to eq 'statement'
  end

end
