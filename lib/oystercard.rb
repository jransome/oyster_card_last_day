
class Oystercard

  attr_reader :balance, :entry_station
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Top up limit is £#{MAX_BALANCE}" if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds" if balance < MIN_BALANCE
    @entry_station = station
  end

  def touch_out(fare = MIN_FARE)
    deduct(fare)
    @entry_station = nil
  end

  private
  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    false if @entry_station == nil else true
  end

end
