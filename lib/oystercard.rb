
class Oystercard

  CURRENT_BALANCE = 0
  MAX_BALANCE = 90

  attr_reader :balance
  attr_reader :max_balance

  def initialize(balance=CURRENT_BALANCE, max_balance=MAX_BALANCE)
    @balance = CURRENT_BALANCE
  end

  def top_up(amount)
    @balance += amount
  end

end