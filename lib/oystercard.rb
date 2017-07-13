class Oystercard

  attr_reader :balance, :journey_history
  MAX_BALANCE = 90
  MIN_BALANCE = 1

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
    if in_journey?
      puts "Penalty fare deducted"
      deduct(@journey_history.last.fare)
    end
    @journey_history << Journey.new(entry_station, nil)
  end

  def touch_out(exit_station)
    if in_journey?
      save_journey(exit_station)
      puts "fare deducted"
      deduct(@journey_history.last.fare)
    else
      @journey_history << Journey.new(nil, exit_station)
      puts "Penalty fare deducted"
      deduct(@journey_history.last.fare)
    end
  end

  def in_journey?
    return false if @journey_history.empty?
    @journey_history.last.in_journey?
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def save_journey(exit_station)
    @journey_history.last.end_journey(exit_station)
  end

end
