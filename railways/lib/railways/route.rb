# Класс Route (Маршрут):
class Route
  include InstanceCounter

  attr_reader :stations

  # Имеет начальную и конечную станцию, а также список промежуточных станций.
  # Начальная и конечная станции указываются при создании маршрута, а промежуточные могут добавляться между ними.
  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    validate!

    register_instance
  end

  # Может добавлять промежуточную станцию в список
  def add_station(station)
    last_station = stations.pop
    @stations << station << last_station
  end

  # Может удалять промежуточную станцию из списка
  def remove_station(station)
    station.trains.each { |_type, trains| trains.each { |train| station.departure_train train } }
    stations.delete station
  end

  # Может выводить список всех станций по порядку от начальной до конечной
  def list_stations
    stations.each { |station| puts station.name }
  end

  def first_station
    stations.first
  end

  def last_station
    stations.last
  end

  def valid?
    validate!
    true
  rescue RuntimeError
    false
  end

  protected

  def validate!
    raise 'Last station should be specified' if stations.length < 2
    raise 'Stations should be specified' if stations.empty?
    raise 'Stations should be objects of Station' if first_station.class != Station || last_station.class != Station
  end
end
