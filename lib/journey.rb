require_relative 'station'
class Journey
  attr_reader :entry_station, :exit_station, :complete_journey

  MINIMUM_FARE = 1.5

  def initialize
    @in_journey = false
    @entry_station = nil
    @exit_station = nil
    @complete_journey = []
  end

  def touch_in(station)
    @entry_station = station
    @in_journey = true
  end
  def touch_out(station)
    @exit_station = station
    @in_journey = false
    @entry_station = nil
  end

  def in_journey?
    # => !! forces a predicate method to return ONLY true or false (no NIL)
    # why entry_station and not @entry_station
    !!entry_station
  end
end
