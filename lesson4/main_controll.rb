require_relative "train"
require_relative "train_pas"
require_relative "train_cargo"
require_relative "carriage"
require_relative "carriage_pas"
require_relative "carriage_cargo"
require_relative "station"
require_relative "route"

class Controller
  def initialize
    @stations = []
    @trains = []
  end

  def start
    loop do
      puts "What you want to do ?"
      puts "1. create a station"
      puts "2. create train"
      puts "3. add carriage to train"
      puts "4. remove carriage from train"
      puts "5. send train to the station"
      puts "6. stations list"
      puts "7. train list on the station"
      puts "8. exit"
      answer = gets.chomp.to_i
      break if answer == 8
      case answer
      when 1 then create_station
      when 2 then create_train
      when 3 then add_carriages
      when 4 then remove_carriages
      when 5 then send_train_to_the_station
      when 6 then stations_list
      when 7 then station_trains
      end
      puts "--------------------"
      sleep 1
    end
  end

  def create_station
    puts "Type 'name' of station"
    name = gets.chomp.to_s
    @stations << Station.new(name)
    sleep 1
    puts "Station '#{name}' created"
  end

  def create_train
    puts "1. passanger train"
    puts "2. cargo train"
    train = gets.chomp.to_i
    if train == 1
      @trains << TrainPas.new
      sleep 1
      puts "Passanger train was created"
    elsif train == 2
      @trains << TrainCargo.new
      sleep 1
      puts "Cargo train was created"
    end
  end

  def add_carriages
    if @trains.empty?
      puts "First you need create a train"
    else
      puts "Choose the train to which to add the carriage"
      trains_list
      train = gets.chomp.to_i
      @trains[train - 1].plus_carriage
    end
    sleep 1
  end

  def remove_carriages
    if @trains.empty?
      puts "First you need create a train"
    else
      puts "Choose the train to which to remove the carriage"
      trains_list
      train = gets.chomp.to_i
      @trains[train - 1].minus_carriage
    end
  end

  def send_train_to_the_station
    if @stations.empty?
      puts "Firss you need create a station"
    elsif @trains.empty?
      puts "First you need create a train"
    else
      puts "Choose the train wich you want to send"
      trains_list
      train = gets.chomp.to_i - 1
      puts "Choose the station where the train will arrive"
      stations_list
      station = gets.chomp.to_i - 1
      if @trains[train].station.any?
        @trains[train].station[0].take_off @trains[train]
      end
      sleep 1
      @trains[train].station = @stations[station]
      @stations[station].take @trains[train]
    end
  end

  def station_trains
    if @stations.empty?
      puts "Not stations yet"
    else
      puts "Choose the station where you want to see the list of trains"
      stations_list
      station = gets.chomp.to_i - 1
      sleep 1
      puts @stations[station].list
    end
  end

  def stations_list
    if @stations.empty?
      puts "Stations list is empty yet"
    else
      @stations.each_with_index do |station, index|
        puts "#{index + 1}. #{station.name}"
      end
    end
  end

  private

  def trains_list
    @trains.each_with_index do |train, index|
      puts "#{index + 1}. #{train.object_id} #{train.type.to_s} train with #{train.carriages_count} carriages"
    end
  end
end

Controller.new.start
