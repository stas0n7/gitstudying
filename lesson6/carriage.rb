class Carriage
  #include Manufacturer
  attr_reader :type
  attr_reader :train

  def initialize
    @train = ""
  end

  def take(train)
    if train.type == @type
      @train = train
    end
  end

  def take_off
    @train = ""
  end
end
