
class Oystercard

  CURRENT_BALANCE = 0
  MAX_BALANCE
  attr_reader :balance

  def initialize(balance=CURRENT_BALANCE)
    @balance = CURRENT_BALANCE
  end

  def top_up(amount)
    @balance += amount
  end

end