
class Oystercard

  CURRENT_BALANCE = 0
  MAX_BALANCE = 90
  STATUS = "New oyster"
  ENTRY_STATION = ""

  attr_reader :balance
  attr_reader :max_balance
  attr_reader :status
  attr_reader :entry_station

  def initialize(balance=CURRENT_BALANCE, max_balance=MAX_BALANCE)
    @balance = CURRENT_BALANCE
    @max_balance = MAX_BALANCE
    @entry_station = nil
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

  def touch_in(entry_point)
    if @balance > 1
      @entry_station = entry_point
    else
      raise "Min balance is £1"
    end
  end

  def touch_out
    @balance -= 1
    @entry_station = nil
  end

  def in_journey?
    if @entry_station == !nil
      return true
    else
      return false
    end
  end

end