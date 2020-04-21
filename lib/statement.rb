class Statement

  def generate_stat(trans_history)
    header = "date       || credit || debit || balance"
    stats = []

    trans_history.each do |x|
      stats << "#{x[:date]} || #{x[:deposit]} || #{x[:withdrawal]} || #{x[:balance]}"
    end

    return header + "\n" + stats.join("\n")
  end
end
