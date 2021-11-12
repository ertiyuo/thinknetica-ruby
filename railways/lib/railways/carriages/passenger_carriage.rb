require_relative 'carriage'

class PassengerCarriage < Carriage
  attr_reader :taken_seats

  def initialize(seats)
    @seats = seats
    @taken_seats = 0

    super(:passenger)
  end

  def take_seat
    raise 'No more seats!' if free_seats.zero?

    @taken_seats += 1
  end

  def free_seats
    @seats - taken_seats
  end
end
