class Train
  attr_reader :number, :type, :carriages, :current_station

  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages

    @speed = 0
  end

  def speed_up(diff)
    @speed += diff
  end

  def stop
    @speed = 0
  end

  def add_carriage
    return "Stop first" if is_moving?

    @carriages += 1
  end

  def remove_carriage
    return "Stop first" if is_moving?

    @carriages -= 1
  end

  def follow_route(route)
    @route = route
    @current_station = route.stations[0]
    @current_station.arrive_train self
  end

  def go_forward
    return "At what speed?" if !is_moving?
    return "It is the end!" if !next_station

    arrive_to self.next_station
  end

  def go_back
    return "At what speed?" if !is_moving?
    return "It is the beginning!" if !previous_station

    arrive_to self.previous_station
  end

  protected

  # используется только объектом класса и потомками
  attr_reader :route

  # используется только объектом класса
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
    @current_station.departure_train self
    @current_station = station
    @current_station.arrive_train self
  end

  # используется только объектом класса и потомками
  def is_moving?
    !@speed.zero?
  end
end
