# frozen_string_literal: true

class TrainPas < Train
  validate :number, :format, NUMBER_FORMAT

  def initialize(number)
    super
    @type = :pas
  end
end
