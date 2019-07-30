
class Oystercard

  CURRENT_BALANCE = 0
  MAX_BALANCE = 90
  STATUS = "New oyster"
  ENTRY_STATION = nil
  EXIT_STATION = nil
  JOURNEYS = []
  JOURNEY_COUNT = 0


  attr_reader :balance
  attr_reader :max_balance
  attr_reader :status
  attr_reader :entry_station
  attr_reader :exit_station
  attr_reader :journeys
  attr_reader :journey_count

  def initialize(balance=CURRENT_BALANCE, max_balance=MAX_BALANCE)
    @balance = CURRENT_BALANCE
    @max_balance = MAX_BALANCE
    @entry_station = ENTRY_STATION
    @exit_station = EXIT_STATION
    @journeys = JOURNEYS
    @journey_count = 0

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
      @journeys << {}
      @journeys[@journey_count] = {entry_point => nil}
    else
      raise "Min balance is £1"
    end
  end

  def touch_out(exit_point)
    @balance -= 1
    @exit_station = exit_point
    @journeys[@journey_count] = {@entry_station => exit_point}
    @journey_count += 1
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