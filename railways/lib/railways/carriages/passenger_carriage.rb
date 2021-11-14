require_relative 'carriage'

class PassengerCarriage < Carriage
  def initialize(seats)
    super(:passenger, seats)
  end

  def take_seat
    take_space(1)
  end
end
