require_relative 'station'
class Journey
  attr_reader :entry_station, :exit_station
  attr_accessor :complete_journey
  MINIMUM_FARE = 1.5
  PENALTY_FARE = 6

  def initialize
    @entry_station = nil
    @exit_station = nil
    @complete_journey = nil
  end

  def touch_in(station)
    @entry_station = station
  end
  def touch_out(station)
    @exit_station = station
    @complete_journey = {origin: @entry_station, destination: @exit_station}
    @entry_station = nil
  end

  def in_journey?
    # => !! forces a predicate method to return ONLY true or false (no NIL)
    # why entry_station and not @entry_station
    !!@entry_station
  end

  def fare
    6
  end
end
