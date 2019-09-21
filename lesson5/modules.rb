#task 1
module Manufacturer
  attr_accessor :manufacturer
end

#task 4
module InstanceCounter
  def self.included(clas)
    clas.extend ForClass
    clas.send :include, ForInstance
  end

  module ForClass
    @@objects = 0

    def instances
      @@objects
    end

    private

    def plus_object
      @@objects += 1
    end
  end

  module ForInstance
    private

    def register_instance
      self.class.send :plus_object
    end
  end
end
