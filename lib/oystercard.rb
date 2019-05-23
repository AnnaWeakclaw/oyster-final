class Oystercard
  LIMIT = 90
  attr_reader :balance, :history

  def initialize(balance=0,journey_log = JourneyLog)
    @balance = balance
    # @journey_class = journey_class
    # @journey = @journey_class.new
    @journey_log = journey_log.new
  end

  def top_up(amount)
    raise "limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise "not enough funds" if @balance < Journey::MINIMUM_FARE
    # complete_journey if @journey.status == :not_complete
    # @journey.set_entry_station(station)
  end

  def touch_out(station)
    # @journey.exit_station = station
    complete_journey
  end

  def complete_journey
    @journey_log.store_journey(@journey)
    deduct
    @journey = @journey_class.new
  end
  
  def journey?
    !@journey.entry_station.nil?
  end
  private

  def deduct
    @balance -= @journey.fare
  end

end
