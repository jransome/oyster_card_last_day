class Journey

  attr_reader :entry_station, :exit_station
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station  = exit_station
  end

  def end_journey(station)
    @exit_station = station
  end

  def fare
    return PENALTY_FARE if in_journey?
    MINIMUM_FARE
  end

  def in_journey?
    !(@entry_station != nil && @exit_station != nil)
  end

end
