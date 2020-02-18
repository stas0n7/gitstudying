class Route
  attr_reader :stations

  def initialize
    @stations = []
  end

  def station_add(station)
    raise ArgumentError, "Argument should be Station class" if station.class != Station
    @stations << station.name
  end

  def station_del(station)
    @stations.delete(station)
  end
end
