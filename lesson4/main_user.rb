
require_relative "train"
require_relative "train_pas"
require_relative "train_cargo"
require_relative "carriage"
require_relative "carriage_pas"
require_relative "carriage_cargo"
require_relative "station"
require_relative "route"
stations = []
trains = []
carriages = []
loop do
  puts "What you want to do ?"
  puts "1. create a station"
  puts "2. create train"
  puts "3. create carriage"
  puts "4. send train to the station"
  puts "5. stations list"
  puts "6. train list on the station"
  puts "7. hooking carriage to train"
  puts "8. unhooking carriage from train"
  puts "9. exit"
  choise = gets.chomp.to_i
  case choise
  when 1
    puts "Type 'name' of station"
    station = gets.chomp.to_s
    stations << Station.new(station)
    sleep 1
    puts "Station '#{station}' created"
  when 2
    puts "1. passanger train"
    puts "2. cargo train"
    train = gets.chomp.to_i
    if train == 1
      trains << TrainPas.new
      sleep 1
      puts "Passanger train was created"
    elsif train == 2
      trains << TrainCargo.new
      sleep 1
      puts "Cargo train was created"
    end
  when 3
    puts "1. passanger carriage"
    puts "2. cargo carriage"
    carriage = gets.chomp.to_i
    if carriage == 1
      carriages << CarriagePas.new
      sleep 1
      puts "Passanger carriage was created"
    elsif carriage == 2
      carriages << CarriageCargo.new
      sleep 1
      puts "Cargo carriage was created"
    end
  when 4
    if stations.empty?
      puts "Firss you need create a station"
    elsif trains.empty?
      puts "First you need create a train"
    else
      puts "Choose the train wich you want to send"
      trains.each do |train| puts "#{(trains.index train) + 1}. #{train.type} train with #{train.carriages_count} carriages" end
      train = gets.chomp.to_i - 1
      puts "Choose the station where the train will arrive"
      stations.each do |station| puts "#{(stations.index station) + 1}. #{station.name}" end
      station = gets.chomp.to_i - 1
      if trains[train].station.any?
        trains[train].station[0].take_off trains[train]
      end
      sleep 1
      trains[train].station = stations[station]
      stations[station].take trains[train]
    end
  when 5
    sleep 1
    if stations.empty?
      puts "Stations list is empty yet"
    else
      stations.each do |station| puts "- #{station.name}" end
    end
  when 6
    if stations.empty?
      puts "Not stations yet"
    else
      puts "Choose the station where you want to see the list of trains"
      stations.each do |station| puts "#{(stations.index station) + 1}. #{station.name}" end
      station = gets.chomp.to_i - 1
      sleep 1
      puts stations[station].list
    end
  when 7
    if trains.empty?
      puts "First you need create a train"
    elsif carriages.empty?
      puts "First you need create a carriage"
    else
      puts "Choose the train to which to hooking the carriage"
      trains.each do |train| puts "#{(trains.index train) + 1}. #{train.type} train with #{train.carriages_count} carriages" end
      train = gets.chomp.to_i - 1
      puts "Choose a carriage to hooking"
      carriages.each do |carriage| puts "#{(carriages.index carriage) + 1}. #{carriage.type} carriage" end
      carriage = gets.chomp.to_i - 1
      trains[train].plus_carriage carriages[carriage]
      carriages[carriage].take trains[train]
    end
  when 8
    if trains.empty?
      puts "First you need create a train"
    else
      puts "Choose the train to witch to unhooking the carriage"
      trains.each do |train| puts "#{(trains.index train) + 1}. #{train.type} train with #{train.carriages_count} carriages" end
      train = gets.chomp.to_i - 1
      trains[train].minus_carriage
    end
  end

  puts " "
  break if choise == 9
  sleep 1
end
