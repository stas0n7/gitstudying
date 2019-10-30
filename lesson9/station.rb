# frozen_string_literal: true

class Station
  include Validation

  validate :name, :presence

  attr_reader :name

  def initialize(name)
    @name = name
    @train_list = []
    @pas = 0
    @cargo = 0
  end

  # lesson 7 , task 1 on 15-27 strings
  def block_method(&block)
    if @train_list.empty?
      puts 'No trains on the station'
    elsif block_given?
      @train_list.each do |train|
        block.call(train)
      end
    else
      puts 'No blocks'
    end
  end

  # block_method { |x| puts "#{x} I am train on the station" }

  def self.all
    ObjectSpace.each_object(self) { |station| puts station.name }
  end

  def take(train)
    if @train_list.include? train
      puts 'This train already on the station'
    else
      puts "On the station #{@name} arrived #{train.type} train #{train.number},with #{train.carriages_count} carriages"
      @train_list << train
      case train.type
      when :pas then @pas += 1
      when :cargo then @cargo += 1
      end
    end
  end

  def take_off(train)
    if @train_list.include? train
      puts "From station #{@name} departed #{train.type} train #{train.number}, with #{train.carriages_count} carriages"
      @train_list.delete(train)
      case train.type
      when :pas then @pas -= 1
      when :cargo then @cargo -= 1
      end
    else
      puts 'This train is not at this station'
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
      puts 'No trains on this station yet'
    else
      puts 'On the station now :'
      @train_list.find_all do |train|
        puts "#{train.type} train #{train.number} , with #{train.carriages_count} carriages"
      end
    end
  end
end
