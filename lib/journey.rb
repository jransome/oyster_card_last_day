class Journey

  attr_reader :entry_station, :exit_station, :complete
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station  = exit_station
    if @entry_station == nil && @exit_station != nil
      @complete = true
    else
      @complete = false
    end
  end

  def end_journey(station)
    @exit_station = station
    @complete = true
  end

  def fare
    return PENALTY_FARE if @entry_station == nil || @exit_station == nil
    MINIMUM_FARE
  end

end
