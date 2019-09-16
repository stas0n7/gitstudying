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
    def instances
      ObjectSpace.each_object(self).count
    end
  end

  module ForInstance
    @@instances = 0

    def count_instances
      @@instances
    end

    private

    def register_instance
      @@instances += 1
    end
  end
end
