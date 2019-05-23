# require 'pry-byebug'
class Journey
  attr_reader :history, :entry_station
  attr_accessor :exit_station


  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def set_entry_station(entry_station)
    @entry_station = entry_station
  end

  def set_exit_station(exit_station)
    @exit_station = exit_station
  end

  def fare
    valid_journey? ? MINIMUM_FARE : PENALTY_FARE
  end

  def valid_journey?
    !@entry_station.nil? && !@exit_station.nil?
  end

  def status
    # binding.pry
    if valid_journey?
      :complete
    elsif @entry_station.nil? && @exit_station.nil?
      :no_journey
    else
      :not_complete
    end
  end
end
