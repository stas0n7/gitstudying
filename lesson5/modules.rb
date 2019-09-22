#task 1
module Manufacturer
  attr_accessor :manufacturer
end

#task 4
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :instances_count

    private

    def plus_object
      @instances_count ||= 0
      @instances_count += 1
    end
  end

  module InstanceMethods
    private

    def register_instance
      self.class.send :plus_object
    end
  end
end
