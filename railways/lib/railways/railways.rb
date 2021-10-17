# frozen_string_literal: false

# Класс для управления железнодорожными станциями. Позволяет:
# - Создавать станции
# - Создавать поезда
# - Создавать маршруты и управлять станциями в нем (добавлять, удалять)
# - Назначать маршрут поезду
# - Добавлять вагоны к поезду
# - Отцеплять вагоны от поезда
# - Перемещать поезд по маршруту вперед и назад
# - Просматривать список станций и список поездов на станции
class Railways
  ACTIONS = {
    create_station: 'create station',
    print_stations: 'print stations',
    print_station_trains: 'print trains on station',

    create_route: 'create route',
    add_station: 'add station to route',
    remove_station: 'remove station from route',

    create_train: 'create train',
    add_carriage: 'add carriage to train',
    remove_carriage: 'remove carriage from train',
    set_route: 'set route for train',
    move_forward: 'move train forward',
    move_back: 'move train back'
  }.freeze

  attr_reader :stations, :routes, :trains

  def initialize
    @stations = []
    @routes = []
    @trains = []
  end

  def create_station
    print 'Station name: '
    name = gets.chomp

    stations << Station.new(name)

    print "Station #{name} created. "
  end

  def print_stations
    stations.each_with_index { |station, id| puts "#{id + 1} - #{station.name}" }
  end

  def print_station_trains
    puts 'print station trains'
  end

  def create_route
    puts 'Choose departure station: '
    departure = choose_station_by_input

    puts 'Choose arrival station: '
    arrival = choose_station_by_input

    routes << Route.new(departure, arrival)

    print "New route from #{departure.name} to #{arrival.name} created. "
  end

  def add_station
    puts 'Choose route: '
    route = choose_route_by_input

    puts 'Choose station: '
    station = choose_station_by_input

    route.add_station station

    print "Station #{station.name} added to route from #{route.first_station.name} to #{route.last_station.name}. "
  end

  def remove_station
    puts 'remove station'
  end

  def create_train
    print 'Train type (cargo or passenger): '
    type = gets.chomp
    print 'Train number: '
    number = gets.chomp

    trains << Train.new(number, type)

    print "New #{type} train ##{number} created. "
  end

  def add_carriage
    puts 'add carriage'
  end

  def remove_carriage
    puts 'remove carriage'
  end

  def set_route
    puts 'set train route'
  end

  def move_forward
    puts 'move train forward'
  end

  def move_back
    puts 'move train back'
  end

  private

  attr_writer :stations, :routes, :trains

  def choose_station_by_input
    choose_by_input(stations, &:name)
  end

  def choose_route_by_input
    choose_by_input(routes) { |route| "from #{route.first_station.name} to #{route.last_station.name}" }
  end

  def choose_by_input(entities)
    entities.each_with_index { |entity, id| puts "#{id + 1} - #{yield(entity)}" }
    entities[gets.chomp.to_i - 1]
  end
end
