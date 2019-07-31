
class Oystercard

  CURRENT_BALANCE = 0
  MAX_BALANCE = 90
  MINIMUM_BALANCE = 1
  STATUS = "New oyster"
  ENTRY_STATION = nil
  EXIT_STATION = nil
  JOURNEYS = []
  JOURNEY_COUNT = 0
  FARE = 1

  attr_reader :balance
  attr_reader :max_balance
  attr_reader :status
  attr_reader :entry_station
  attr_reader :exit_station
  attr_reader :journeys
  attr_reader :journey_count
  attr_reader :minimum_balance
  attr_reader :fare

  def initialize(balance=CURRENT_BALANCE, max_balance=MAX_BALANCE)
    @balance = CURRENT_BALANCE
    @max_balance = MAX_BALANCE
    @entry_station = ENTRY_STATION
    @exit_station = EXIT_STATION
    @journeys = JOURNEYS
    @journey_count = JOURNEY_COUNT
    @minimum_balance = MINIMUM_BALANCE
  end

  def top_up(amount)
    if @balance + amount < MAX_BALANCE
      @balance += amount
    else
      raise "Max balance is #{MAX_BALANCE}"
    end
  end

  def deduct
    @balance -= FARE
  end

  def touch_in(entry_point)
    if @balance >= @minimum_balance
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
