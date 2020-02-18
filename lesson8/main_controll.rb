# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'manufacturer'
require_relative 'train'
require_relative 'train_pas'
require_relative 'train_cargo'
require_relative 'carriage'
require_relative 'carriage_pas'
require_relative 'carriage_cargo'
require_relative 'station'
require_relative 'route'

class Controller
  def initialize
    @stations = []
    @trains = []
    @carriages = []
  end

  def start
    loop do
      puts 'What you want to do ?'
      puts '1. create a station'
      puts '2. create train'
      puts '3. create carriage'
      puts '4. add carriage to train'
      puts '5. remove carriage from train'
      puts '6. send train to the station'
      puts '7. stations list'
      puts '8. train list on the station'
      puts '9. exit'
      answer = gets.chomp.to_i
      break if answer == 9

      case answer
      when 1 then create_station
      when 2 then create_train
      when 3 then create_carriage
      when 4 then add_carriages
      when 5 then remove_carriages
      when 6 then send_train_to_the_station
      when 7 then stations_list
      when 8 then station_trains
      end
      puts '--------------------'
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
    puts '1. Passanger train'
    puts '2. Cargo train'
    case gets.chomp.to_i
    when 1
      puts 'Enter number of train'
      number = gets.chomp
      @trains << TrainPas.new(number)
      sleep 1
      puts 'Passanger train was created'
    when 2
      puts 'Enter number of train'
      number = gets.chomp
      @trains << TrainCargo.new(number)
      sleep 1
      puts 'Cargo train was created'
    end
  end

  def create_carriage
    puts '1. Passanger carriage'
    puts '2. Cargo carriage'
    case gets.chomp.to_i
    when 1
      @carriages << CarriagePas.new
      sleep 1
      puts 'Passanger carriage was created'
    when 2
      @carriages << CarriagesCargo.new
      sleep 1
      puts 'Cargo carriage was created'
    end
  end

  def add_carriages
    if @trains.empty?
      puts 'First you need create a train'
    elsif @carriages.empty?
      puts 'First you need create a carriage'
    else
      puts 'Choose the train to which to add the carriage'
      trains_list
      train = gets.chomp.to_i - 1
      puts 'Choose the carriage witch to add'
      carriages_list
      carriage = gets.chomp.to_i - 1
      @trains[train].plus_carriage @carriages[carriage]
    end
    sleep 1
  end

  def remove_carriages
    if @trains.empty?
      puts 'First you need create a train'
    else
      puts 'Choose the train to which to remove the carriage'
      trains_list
      train = gets.chomp.to_i - 1
      @trains[train].minus_carriage
    end
  end

  def send_train_to_the_station
    if @stations.empty?
      puts 'Firss you need create a station'
    elsif @trains.empty?
      puts 'First you need create a train'
    else
      puts 'Choose the train wich you want to send'
      trains_list
      train = gets.chomp.to_i - 1
      puts 'Choose the station where the train will arrive'
      stations_list
      station = gets.chomp.to_i - 1
      @trains[train].station[0].take_off @trains[train] if @trains[train].station.any?
      sleep 1
      @trains[train].station = @stations[station]
      @stations[station].take @trains[train]
    end
  end

  def station_trains
    if @stations.empty?
      puts 'Not stations yet'
    else
      puts 'Choose the station where you want to see the list of trains'
      stations_list
      station = gets.chomp.to_i - 1
      sleep 1
      puts @stations[station].list
    end
  end

  def stations_list
    if @stations.empty?
      puts 'Stations list is empty yet'
    else
      @stations.each_with_index do |station, index|
        puts "#{index + 1}. #{station.name}"
      end
    end
  end

  private

  def carriages_list
    @carriages.each_with_index do |carriage, index|
      puts "#{index + 1}. #{carriage.object_id} #{carriage.type} carriage"
    end
  end

  def trains_list
    @trains.each_with_index do |train, index|
      puts "#{index + 1}. #{train.number} #{train.type} train with #{train.carriages_count} carriages"
    end
  end
end

Controller.new.start
