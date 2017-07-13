

class Oystercard

  attr_reader :balance, :journey_history
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

  def touch_in(entry_station)
    fail "Insufficient funds" if balance < MIN_BALANCE
    @journey_history << Journey.new(entry_station)
  end

  def touch_out(fare = MIN_FARE, exit_station)
    deduct(fare)
    save_journey(exit_station)
    #end journey
  end

  private
  def deduct(amount)
    @balance -= amount
  end

  def save_journey(exit_station)
    @journey_history.last.end_journey(exit_station)
  end

  # def in_journey?
  #   false if @entry_station == nil else true
  # end

end
