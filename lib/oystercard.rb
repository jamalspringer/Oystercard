
class Oystercard

  CURRENT_BALANCE = 0
  MAX_BALANCE = 90

  attr_reader :balance
  attr_reader :max_balance

  def initialize(balance=CURRENT_BALANCE, max_balance=MAX_BALANCE)
    @balance = CURRENT_BALANCE
    @max_balance = MAX_BALANCE
  end

  def top_up(amount)
    if @balance + amount < MAX_BALANCE
      @balance += amount
    else
      raise "Max balance is #{MAX_BALANCE}"
    end
  end

  def deduct(fare)
    @balance -= fare
  end

end