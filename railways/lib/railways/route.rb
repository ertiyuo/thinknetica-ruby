# Класс Route (Маршрут):
class Route
  attr_reader :stations, :first_station, :last_station

  # Имеет начальную и конечную станцию, а также список промежуточных станций.
  # Начальная и конечная станции указываются при создании маршрута, а промежуточные могут добавляться между ними.
  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    @first_station = first_station
    @last_station = last_station
  end

  # Может добавлять промежуточную станцию в список
  def add_station(station)
    last_station = @stations.pop
    @stations << station << last_station
  end

  # Может удалять промежуточную станцию из списка
  def remove_station(station)
    @stations.delete station
  end

  # Может выводить список всех станций по порядку от начальной до конечной
  def list_stations
    @stations.each { |station| puts station.name }
  end
end
