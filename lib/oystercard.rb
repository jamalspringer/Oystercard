
class Oystercard

  CURRENT_BALANCE = 0
  MAX_BALANCE = 90
  STATUS = "New oyster"

  attr_reader :balance
  attr_reader :max_balance
  attr_reader :status

  def initialize(balance=CURRENT_BALANCE, max_balance=MAX_BALANCE)
    @balance = CURRENT_BALANCE
    @max_balance = MAX_BALANCE
    @status = STATUS
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

  def touch_in
    @status = "In Journey"
  end

end