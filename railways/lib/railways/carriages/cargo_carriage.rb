require_relative 'carriage'

class CargoCarriage < Carriage
  attr_reader :occupied

  def initialize(space)
    @space = space
    @occupied = 0

    super(:cargo)
  end

  def take_space(amount)
    raise 'No more space!' if free.zero?

    @occupied += amount
  end

  def free
    @space - occupied
  end
end
