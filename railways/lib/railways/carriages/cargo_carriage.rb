require_relative 'carriage'

class CargoCarriage < Carriage
  attr_reader :occupied_space

  def initialize(space)
    @space = space
    @occupied_space = 0

    super(:cargo)
  end

  def take_space(amount)
    raise 'No more space!' if free_space.zero?

    @occupied_space += amount
  end

  def free_space
    @space - occupied_space
  end
end
