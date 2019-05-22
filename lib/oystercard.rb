class Oystercard
  LIMIT = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :history

  def initialize(balance=0, journey_class = Journey)
    @balance = balance
    @history = []
    @journey_class = journey_class
    @journey = @journey_class.new
  end

  def top_up(amount)
    raise "limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise "not enough funds" if @balance < MINIMUM_FARE
    @entry_station = station
    @journey = @journey_class.new(station)
  end

  def touch_out(station)
    @journey.exit_station = station
    complete_journey
  end

  def complete_journey
    @history.push(@journey)
    deduct
    @journey = @journey_class.new
  end
  
  def journey?
    !@journey.entry_station.nil?
  end
  private

  def deduct
    @balance -= MINIMUM_FARE
  end

end
