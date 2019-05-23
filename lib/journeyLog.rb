class JourneyLog
  attr_reader :history, :journey

  def initialize(journey = Journey)
    @history = []
    @journey = journey
  end

  def store_journey
    history.push(@journey)
  end

end