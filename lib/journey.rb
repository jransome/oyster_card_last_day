

class Journey

  attr_reader :entry_station, :exit_station

  def initialize(station)
    @entry_station = station
    @exit_station = nil
  end

  def end_journey(station)
    @exit_station = station
  #  save_journey(@entry_station, @exit_station)
  end
end
