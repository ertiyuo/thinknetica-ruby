# Класс Train (Поезд):
class Train
  attr_reader :type
  # Может возвращать текущую скорость
  attr_reader :speed
  # Может возвращать количество вагонов
  attr_reader :carriages
  # Может возвращать текущую станцию на основе маршрута
  attr_reader :current_station

  # Имеет номер (произвольная строка), тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages

    @speed = 0
  end

  # Может набирать скорость
  def speed_up(diff)
    @speed += diff
  end

  # Может тормозить (сбрасывать скорость до нуля)
  def stop
    @speed = 0
  end

  # Может прицеплять вагоны (по одному вагону за операцию, метод просто увеличивает количество вагонов).
  # Прицепка вагонов может осуществляться только если поезд не движется.
  def add_carriage
    return "Stop first" if @speed > 0

    @carriages += 1
  end

  # Может отцеплять вагоны (по одному вагону за операцию, метод просто уменьшает количество вагонов).
  # Отцепка вагонов может осуществляться только если поезд не движется.
  def remove_carriage
    return "Stop first" if @speed > 0

    @carriages -= 1
  end

  # Может принимать маршрут следования (объект класса Route).
  # При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
  def follow_route(route)
    @route = route
    @current_station = route.stations[0]
    @current_station.arrive_train self
  end

  # Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
  def go_forward
    return "At what speed?" if @speed == 0
    return "It is the end!" if !next_station

    arrive_to self.next_station
  end

  # Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
  def go_back
    return "At what speed?" if @speed == 0
    return "It is the beginning!" if !previous_station

    arrive_to self.previous_station
  end

  # Может возвращать предыдущую станцию на основе маршрута
  def previous_station
    next_index = @route.stations.index(@current_station) - 1

    next_index >= 0 ? @route.stations[next_index] : nil
  end

  # Может возвращать следующую станцию на основе маршрута
  def next_station
    next_index = @route.stations.index(@current_station) + 1

    @route.stations[next_index]
  end

  def arrive_to(station)
    @current_station.departure_train self
    @current_station = station
    @current_station.arrive_train self
  end
end
