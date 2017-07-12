require 'station'

class Journey

  attr_reader :entry_station, :exit_station

  def initialize(name, zone)
    @entry_station = Station.new(name,zone)
    @exit_station = nil
  end

  def end_journey(name, zone)
    @exit_station = Station.new(name,zone)
    save_journey(@entry_station, @exit_station)
  end


end
