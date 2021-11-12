require_relative 'carriage'

class PassengerCarriage < Carriage
  attr_reader :occupied

  def initialize(seats)
    @seats = seats
    @occupied = 0

    super(:passenger)
  end

  def take_seat
    raise 'No more seats!' if free.zero?

    @occupied += 1
  end

  def free
    @seats - occupied
  end
end
