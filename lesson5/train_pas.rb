class TrainPas
  include Manufacturer
  attr_accessor :speed
  attr_reader :type, :carriages_count, :station, :number

  def initialize
    @type = "pas"
    @carriages_count = 0
    @carriages = []
    @speed = 0
    @station = []
    @route = []
    @number = rand 100
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
    elsif @carriages_count == 0
      puts "Train has no carriages anymore!!"
    else
      @carriages.last.train.pop
      @carriages.pop
      @carriages_count -= 1
      puts "unhooked one carriage"
    end
  end

  def plus_carriage(carriage)
    if @speed != 0
      puts "First you need stop the train"
    elsif carriage.type != @type
      puts "wrong carriage type"
    elsif @carriages.include? carriage
      puts "HEY !! This carriage already hooked to this train!!"
    elsif carriage.train.any?
      puts "HEY !! This carriage already hooked to other train!!"
    else
      @carriages << carriage
      @carriages_count += 1
      puts "hooked one pas carriage"
    end
  end
end
