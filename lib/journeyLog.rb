class JourneyLog
  attr_reader :history, :journey

  def initialize(journey = Journey)
    @history = []
    @journey = journey
  end

  def store_journey(journey)
    history.push(journey)
  end

  def start(station)
    journey.set_entry_station(station)
  end

end