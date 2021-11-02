class Train
  include Vendor
  include InstanceCounter

  attr_reader :number, :type, :carriages, :current_station

  def initialize(number, type)
    @number = number
    @type = type
    validate!

    @carriages = []
    @speed = 0

    register_instance

    self.class.trains << self
  end

  def speed_up
    @speed = 100
  end

  def stop
    @speed = 0
  end

  def add_carriage(carriage)
    return unless can_add_carriage? carriage

    carriages << carriage
  end

  def remove_carriage
    return unless can_change_carriages?

    carriages.pop
  end

  def follow_route(route)
    @route = route
    @current_station = route.stations[0]

    current_station.arrive_train self
  end

  def go_forward
    go
  end

  def go_back
    go :back
  end

  def self.trains
    @@trains ||= []
  end

  def self.find(train_number)
    trains.find { |train| train.number == train_number }
  end

  def valid?
    validate!
    true
  rescue RuntimeError
    false
  end

  protected

  def validate!
    raise 'Number should not be empty' if number == ''
    raise 'Wrong number format' unless number =~ /[a-z\d]{3}-?[a-z\d]{2}/i
    raise 'Wrong train type' unless TYPES.include? type
  end

  # используется только объектом класса и потомками
  attr_reader :route

  # используется только объектом класса и потомками
  def previous_station
    next_index = route.stations.index(current_station) - 1

    next_index >= 0 ? route.stations[next_index] : nil
  end

  # используется только объектом класса и потомками
  def next_station
    next_index = route.stations.index(current_station) + 1

    route.stations[next_index]
  end

  # используется только объектом класса и потомками
  def arrive_to(station)
    current_station.departure_train self
    station.arrive_train self

    @current_station = station
  end

  # используется только объектом класса и потомками
  def moving?
    !@speed.zero?
  end

  # используется только объектом класса и потомками
  def can_add_carriage?(carriage)
    raise 'Wrong carriage!' unless carriage.type == type

    can_change_carriages?
  end

  # используется только объектом класса и потомками
  def can_change_carriages?
    moving?
  end

  # используется только объектом класса и потомками
  def go(direction = :forward)
    raise 'At what speed?' unless moving?

    station = direction == :forward ? next_station : previous_station
    raise direction == :forward ? 'It is the end!' : 'It is the beginning!' unless station

    arrive_to station
  end
end
