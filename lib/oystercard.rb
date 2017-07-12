require 'journey'

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

  def touch_in(name,zone)
    fail "Insufficient funds" if balance < MIN_BALANCE
    journey = Journey.new(name,zone)
  end

  def touch_out(fare = MIN_FARE, name, zone)
    deduct(fare)
    save_journey(entry_station, exit_station)
    #end journey
  end

  def save_journey(entry_station, exit_station)
    @journey_history << {entry_station => exit_station}
  end

  private
  def deduct(amount)
    @balance -= amount
  end

  # def in_journey?
  #   false if @entry_station == nil else true
  # end

end
