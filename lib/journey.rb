class Journey
  attr_reader :entry_station, :history
  attr_accessor :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end
end