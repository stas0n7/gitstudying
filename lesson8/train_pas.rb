# frozen_string_literal: true

class TrainPas < Train
  def initialize(number)
    super
    @type = :pas
  end
end
