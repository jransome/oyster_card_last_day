
class Oystercard

  attr_reader :balance, :entry_station, :journey_history
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(amount)
    fail "Top up limit is £#{MAX_BALANCE}" if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds" if balance < MIN_BALANCE
    @entry_station = station
  end

  def touch_out(fare = MIN_FARE, station)
    deduct(fare)
    @exit_station = station
    save_journey
  end

  def save_journey
    key = @entry_station
    value = @exit_station
    @journey_history << {key => value}
  end

  private
  def deduct(amount)
    @balance -= amount
  end

  # def in_journey?
  #   false if @entry_station == nil else true
  # end

end
