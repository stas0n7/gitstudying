# frozen_string_literal: true

class Carriage
  # include Manufacturer
  attr_reader :type
  attr_reader :train

  def initialize
    @train = ''
  end

  def take(train)
    @train = train if train.type == @type
  end

  def take_off
    @train = ''
  end
end
