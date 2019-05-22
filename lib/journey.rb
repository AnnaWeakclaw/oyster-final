class Journey
  attr_reader :entry_station, :history
  attr_accessor :exit_station

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def fare
    valid_journey? ? MINIMUM_FARE : PENALTY_FARE
  end

  def valid_journey?
    !(@entry_station && @exit_station).nil?
  end
end
