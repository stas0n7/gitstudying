class CarriagePas
  include Manufacturer

  attr_reader :type
  attr_reader :train

  def initialize
    @type = "pas"
    @train = []
  end

  def take(train)
    if train.type == @type
      @train << train
    end
  end
end
