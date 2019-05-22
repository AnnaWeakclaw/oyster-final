class Oystercard
  LIMIT = 90
  MINIMUM = 1
  MINIMUM_FARE = 1
  attr_reader :balance, :journey, :entry_station, :history, :exit_station

  def initialize(balance=0, journey_class = Journey)
    @balance = balance
    @journey = false
    @history = []
    @journey_class = journey_class
  end

  def top_up(amount)
    raise "limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise "not enough funds" if @balance < MINIMUM
    @entry_station = station
    @journey1 = @journey_class.new(station)
  end

  def touch_out(station)
    @journey1.exit_station = station
    @entry_station = nil
    @history.push(@journey1)
    deduct
  end

  def journey?
    @entry_station ?  @journey = true :  @journey = false
  end


  private

  def deduct
    @balance -= MINIMUM_FARE
  end

end
