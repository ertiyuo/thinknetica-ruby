require_relative 'carriage'

class CargoCarriage < Carriage
  def initialize(space)
    super(:cargo, space)
  end
end
