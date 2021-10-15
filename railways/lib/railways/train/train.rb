class Train
  attr_reader :number, :type, :carriages, :current_station

  def initialize(number, type)
    @number = number
    @type = type

    @carriages = []
    @speed = 0
  end

  def speed_up(diff)
    @speed += diff
  end

  def stop
    @speed = 0
  end

  def add_carriage(carriage)
    return unless can_add_carriage? carriage

    puts "Carriage added to #{type} train #{number}. Carriages count: #{carriages.count}"
    carriages << carriage
  end

  def remove_carriage
    return unless can_change_carriages?

    carriages.pop
    puts "Carriage removed from train #{number}. Carriages count: #{carriages.count}"
  end

  def follow_route(route)
    @route = route
    @current_station = route.stations[0]
    @current_station.arrive_train self
  end

  def go_forward
    if is_moving?
      if next_station
        arrive_to next_station
      else
        puts 'It is the end!'
      end
    else
      puts 'At what speed?'
    end
  end

  def go_back
    if is_moving?
      if previous_station
        arrive_to previous_station
      else
        puts 'It is the beginning!'
      end
    else
      puts 'At what speed?'
    end
  end

  def go(_direction)
    if is_moving?
      if next_station
        arrive_to next_station
      else
        puts 'It is the end!'
      end
    else
      puts 'At what speed?'
    end
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
    @current_station.departure_train self
    @current_station = station
    @current_station.arrive_train self
  end

  # используется только объектом класса и потомками
  def is_moving?
    !@speed.zero?
  end

  def can_add_carriage?(carriage)
    if carriage.type != type
      puts 'Wrong carriage!'
      return false
    end

    can_change_carriages?
  end

  def can_change_carriages?
    if is_moving?
      puts 'Can not remove carriage while moving'
      return false
    end

    true
  end
end
