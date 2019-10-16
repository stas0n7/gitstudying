# frozen_string_literal: true

class CarriageCargo < Carriage
  def initialize
    super
    @type = :cargo
  end
end
