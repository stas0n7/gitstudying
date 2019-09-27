class Train
  #include Manufacturer
  attr_accessor :speed
  attr_reader :type, :carriages_count, :station, :number
  NUMBER_FORMAT = /^([a-z]{3}|\d{3})-?([a-z]{2}|\d{2})$/i
  @@instances = []

  def initialize(number)
    @carriages_count = 0
    @carriages = []
    @speed = 0
    @station = []
    @route = []
    @number = number
    begin
      validate!
    rescue ArgumentError => e
      puts e.inspect
    end
    number_unique
    @@instances << self
  end

  def valid?
    validate!
  rescue
    false
  end

  def self.find(integer)
    ObjectSpace.each_object(self).to_a.find { |train| train.number == integer }
  end

  def route_take(route)
    route.stations.each { |station| @route << station }
    puts "A train took a route #{@route}"
  end

  def route_go
    i = 0
    if @route.empty?
      puts "Route is not found. At first took the route"
    else
      puts "Next station #{@route[i]} - first station of the route "
      puts "Station #{@route[i]}"
      puts "Next station #{@route[i + 1]}"
      puts "-----------------"
      until i == (@route.size - 2)
        puts "Station #{@route[i + 1]}"
        puts "Previous station  #{@route[i]}"
        puts "Next station #{@route[i + 2]}"
        puts "-----------------"
        i += 1
      end
      puts "Station #{@route.last} , last station of the route"
    end
  end

  def station=(station)
    @station.pop
    @station << station
  end

  def station_leave=(station)
    @station.pop
  end

  def station_now
    if station.empty?
      puts "Train is not on the station now"
    else
      puts "Train on the station #{@station[0].name}"
    end
  end

  def stop
    @speed = 0
  end

  def minus_carriage
    if @speed != 0
      puts "First you need stop the train!!"
    elsif @carriages_count.zero?
      puts "Train has no carriages anymore!!"
    else
      @carriages.last.take_off
      @carriages.pop
      @carriages_count -= 1
      puts "unhooked one carriage"
    end
  end

  def plus_carriage(carriage)
    if @speed != 0
      puts "First you need stop the train"
    elsif carriage.type != @type
      begin
        raise "wrong carriage type"
      rescue RuntimeError
        puts "Error , incorrect carriage type"
      end
    elsif @carriages.include? carriage
      puts "HEY !! This carriage already hooked to this train!!"
    elsif carriage.train != ""
      puts "HEY !! This carriage already hooked to other train!!"
    else
      @carriages << carriage
      carriage.take self
      @carriages_count += 1
      puts "hooked one #{@type} carriage"
    end
  end

  protected

  def number_unique
    raise ArgumentError, "Error! This number already used" if @@instances.find { |train| train.number == number }
  end

  def validate!
    raise ArgumentError, "number has invalid format" if @number !~ NUMBER_FORMAT
    true
  end
end
