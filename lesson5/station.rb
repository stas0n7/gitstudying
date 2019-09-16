class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @train_list = []
    @pas = 0
    @cargo = 0
  end

  #task2 on 3 string below
  def self.all
    ObjectSpace.each_object(self).to_a.each do |station| puts station.name end
  end

  def take(train)
    if @train_list.include? train
      puts "This train already on the station"
    else
      puts "On the station #{@name} arrived #{train.type} train , with #{train.carriages_count} carriages"
      @train_list << train
      if train.type == "pas"
        @pas += 1
      elsif train.type == "cargo"
        @cargo += 1
      end
    end
  end

  def take_off(train)
    unless @train_list.include? train
      puts "This train is not at this station"
    else
      puts "From station #{@name} departed #{train.type} train , with #{train.carriages_count} carriages"
      @train_list.delete(train)
      if train.type == "pas"
        @pas -= 1
      elsif train.type == "cargo"
        @cargo -= 1
      end
    end
  end

  def list_type
    puts "passenger trains - #{@pas} :"
    @train_list.find_all { |train| train.type == "pas" }.each { |train| puts "#{train.type} train" }
    puts "Cargo trains - #{@cargo} :"
    @train_list.find_all { |train| train.type == "cargo" }.each { |train| puts "#{train.type} train" }
  end

  def list
    if @train_list.empty?
      puts "No trains on this station yet"
    else
      puts "On the station now :"
      @train_list.find_all { |train| puts "#{train.type} train , with #{train.carriages_count} carriages" }
    end
  end
end
