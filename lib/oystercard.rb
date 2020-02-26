class OysterCard

  attr_reader :balance, :entry_station, :journeys

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1.5

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end

  def top_up(value)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + value > MAXIMUM_BALANCE
    @balance += value
  end



  def touch_in(station)
    raise "Not enough balance" if @balance < MINIMUM_FARE
    @entry_station = station
    @in_journey = true
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @in_journey = false
    @exit_station = station
    @entry_station = nil
  end

  def in_journey?
    # => !! forces a predicate method to return ONLY true or false (no NIL)
    !!@entry_station
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
