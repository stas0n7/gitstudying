class Route
  attr_reader :stations

  def initialize(stations = [])
    @stations = stations
  end

  def station_add(station)
    @stations << station.name
  end

  def station_del(station)
    @stations.delete(station)
  end
end
