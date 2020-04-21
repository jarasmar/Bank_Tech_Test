class Statement

  def print_statement(trans_history)
    stats = []
    header = "date       || credit || debit || balance"

    trans_history.each do |x|
      stats << "#{x[:date]} || #{x[:deposit]} || #{x[:withdrawal]} || #{x[:balance]}"
    end

    return header + "\n" + stats.join("\n")
  end

  # Example of output
  # date       || credit  || debit  || balance
  # 14/01/2012 ||         || 500.00 || 2500.00
  # 13/01/2012 || 2000.00 ||        || 3000.00
  # 10/01/2012 || 1000.00 ||        || 1000.00
end
