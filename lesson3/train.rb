class Train
  attr_accessor :speed
  attr_reader :train_type, :carriages

  def initialize(train_type, carriages, speed = 0)
    @train_type = train_type
    @carriages = carriages
    @speed = speed
    @station = []
    @route = []
  end

  def route_take(name)
    name.route_stations.each { |x| @route << x }
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

  def station=(name)
    @station << name.name
  end

  def station_leave=(name)
    @station.shift
  end

  def station
    puts "Train on the station #{@station}"
  end

  def minus_carriage
    if @speed == 0
      @carriages -= 1
      puts "unhooked one carriage"
    else
      puts "First you need stop the train!!"
    end
  end

  def plus_carriage
    if @speed == 0
      @carriages += 1
      puts "hooked one carriage"
    else
      puts "First you need stop the train!!"
    end
  end

  def stop
    @speed = 0
  end
end

class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @train_list = []
    @pas = 0
    @cargo = 0
  end

  def take(train)
    puts "On the station #{@name} arrived #{train.train_type} train , with #{train.carriages} carriages"
    @train_list << train.train_type
    if train.train_type == "pas"
      @pas += 1
    elsif train.train_type == "cargo"
      @cargo += 1
    end
  end

  def take_off(train)
    puts "From station#{@name} departed #{train.train_type} train , with #{train.carriages} carriages"
    @train_list.delete(train.train_type)
    if train.train_type == "pas"
      @pas -= 1
    elsif train.train_type == "cargo"
      @cargo -= 1
    end
  end

  def list_type
    puts "passenger trains - #{@pas} :"
    @train_list.find_all { |i| i == "pas" }.each { |x| puts x }
    puts "Cargo trains #{@cargo} :"
    @train_list.find_all { |i| i == "cargo" }.each { |x| puts x }
  end

  def list
    puts "On the station now :"
    @train_list.each { |i| puts i }
  end
end

class Route
  attr_reader :route_stations

  def initialize(route_stations = [])
    @route_stations = route_stations
  end

  def station_add(name)
    @route_stations << name.name
  end

  def station_del(name)
    @route_stations.delete(name)
  end
end

train1 = Train.new("pas", 5)
train2 = Train.new("cargo", 9)
train3 = Train.new("pas", 7)
train4 = Train.new("pas", 13)

station1 = Station.new("kharkov")
station2 = Station.new("moskva")
station3 = Station.new("odessa")
station4 = Station.new("kiev")

route1 = Route.new

train1.speed = 20
train1.speed
train1.stop
train1.plus_carriage

train1.station = station1
train2.station = station1
train3.station = station1
train4.station = station1

station1.take train1
station1.take train2
station1.take train3
station1.take train4

station1.list_type

station1.take_off train1
station1.take_off train2
station1.take_off train3
station1.take_off train4

route1.station_add station1
route1.station_add station2
route1.station_add station3
route1.station_add station4

train2.route_take route1

train2.route_go
