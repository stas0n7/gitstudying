class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @train_list = []
    @pas = 0
    @cargo = 0
    validate!
  rescue RuntimeError
    puts "NAME ERROR!! less then 3 symbol"
  end

  def valid?
    validate!
  rescue
    false
  end

  def self.all
    ObjectSpace.each_object(self) { |station| puts station.name }
  end

  def take(train)
    if @train_list.include? train
      puts "This train already on the station"
    else
      puts "On the station #{@name} arrived #{train.type} train #{train.number}, with #{train.carriages_count} carriages"
      @train_list << train
      case train.type
      when :pas then @pas += 1
      when :cargo then @cargo += 1
      end
    end
  end

  def take_off(train)
    unless @train_list.include? train
      puts "This train is not at this station"
    else
      puts "From station #{@name} departed #{train.type} train #{train.number} , with #{train.carriages_count} carriages"
      @train_list.delete(train)
      case train.type
      when :pas then @pas -= 1
      when :cargo then @cargo -= 1
      end
    end
  end

  def list_type
    puts "passenger trains - #{@pas} :"
    @train_list.find_all { |train| train.type == :pas }.each { |train| puts "#{train.type} train #{train.number}" }
    puts "Cargo trains - #{@cargo} :"
    @train_list.find_all { |train| train.type == :cargo }.each { |train| puts "#{train.type} train #{train.number}" }
  end

  def list
    if @train_list.empty?
      puts "No trains on this station yet"
    else
      puts "On the station now :"
      @train_list.find_all { |train| puts "#{train.type} train #{train.number} , with #{train.carriages_count} carriages" }
    end
  end

  private

  def validate!
    raise "Station name can't be less then 3 symbols" if @name.length < 3
    true
  end
end
