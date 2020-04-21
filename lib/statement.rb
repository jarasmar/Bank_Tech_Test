class Statement

  def generate_statement(transaction_history)
    header = "date       || credit || debit || balance"
    stats = []

    transaction_history.each do |x|
      stats << "#{x[:date]} || #{x[:deposit]} || #{x[:withdrawal]} || #{x[:balance]}"
    end

    return header + "\n" + stats.reverse.join("\n")
  end
end
