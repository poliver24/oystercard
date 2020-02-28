require_relative 'journey'
class OysterCard

  attr_reader :balance, :journey_history

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
    # @entry_station = nil
    # @exit_station = nil
    @journey_history = []
    @journey = Journey.new
  end

  def top_up(value)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + value > MAXIMUM_BALANCE
    @balance += value
  end


  def touch_in(entry_station)
    raise "Not enough balance" if @balance < MINIMUM_FARE
    @journey.touch_in(entry_station)
  end

  def touch_out(exit_station)
    @journey.touch_out(exit_station)
    deduct(@journey.fare)
    @journey_history << @journey.complete_journey
    @journey.complete_journey = nil
  end

  # def in_journey?
  #   # => !! forces a predicate method to return ONLY true or false (no NIL)
  #   # why entry_station and not @entry_station
  #   !!entry_station
  # end

  private
  def deduct(@journey.fare)
    @balance -= amount
  end

end
