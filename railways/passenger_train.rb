require_relative 'train'

class PassengerTrain < Train
  def initialize(number, carriages)
    super(number, :passenger, carriages)
  end
end
