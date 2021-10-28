class Train
  include Vendor

  attr_reader :number, :type, :carriages, :current_station

  def initialize(number, type)
    @number = number
    @type = type

    @carriages = []
    @speed = 0

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
    puts "Carriage added to #{type} train #{number}. Carriages count: #{carriages.count}"
  end

  def remove_carriage
    return unless can_change_carriages?

    carriages.pop
    puts "Carriage removed from train #{number}. Carriages count: #{carriages.count}"
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

  protected

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
    if carriage.type != type
      puts 'Wrong carriage!'
      return false
    end

    can_change_carriages?
  end

  # используется только объектом класса и потомками
  def can_change_carriages?
    if moving?
      puts 'Can not remove carriage while moving.'
      return false
    end

    true
  end

  # используется только объектом класса и потомками
  def go(direction = :forward)
    if moving?
      station = direction == :forward ? next_station : previous_station
      if station
        arrive_to station
      else
        puts direction == :forward ? 'It is the end!' : 'It is the beginning!'
      end
    else
      puts 'At what speed?'
    end
  end
end
