class Journey
  attr_reader :entry_station, :history

  def initialize(entry_station)
    @history = []
    @entry_station = entry_station
  end

end