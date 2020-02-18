# frozen_string_literal: true

class TrainCargo < Train
  validate :number, :format, NUMBER_FORMAT

  def initialize(number)
    super
    @type = :cargo
  end
end
