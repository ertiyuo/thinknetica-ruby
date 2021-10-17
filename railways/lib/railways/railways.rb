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

  TRAIN_TYPES = %i[cargo passenger].freeze

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
    departure = choose_departure_station
    arrival = choose_arrival_station
    routes << Route.new(departure, arrival)

    print "New route from #{departure.name} to #{arrival.name} created. "
  end

  def add_station
    route = choose_route
    station = choose_station
    route.add_station station

    print "Station #{station.name} added to route #{route.first_station.name} - #{route.last_station.name}. "
  end

  def remove_station
    route = choose_route
    station = choose_route_station route
    route.remove_station station

    print "Station #{station.name} removed from route #{route.first_station.name} - #{route.last_station.name}. "
  end

  def create_train
    print 'Train number: '
    number = gets.chomp

    type = choose_train_type

    trains << create_train_by_type(type, number)

    print "New #{type} train ##{number} created. "
  end

  def add_carriage
    train = choose_train
    carriage = create_carriage train
    train.stop
    train.add_carriage carriage
  end

  def remove_carriage
    train = choose_train
    train.stop
    train.remove_carriage
  end

  def set_route
    train = choose_train
    route = choose_route
    train.follow_route route
  end

  def move_forward
    train = choose_train
    train.speed_up
    train.go_forward
  end

  def move_back
    train = choose_train
    train.speed_up
    train.go_back
  end

  private

  attr_writer :stations, :routes, :trains

  def choose_station
    puts "Choose #{yield}station: "
    choose_by_input(stations, &:name)
  end

  def choose_departure_station
    choose_station { 'departure ' }
  end

  def choose_arrival_station
    choose_station { 'arrival ' }
  end

  def choose_route
    puts 'Choose route: '
    choose_by_input(routes) { |route| "from #{route.first_station.name} to #{route.last_station.name}" }
  end

  def choose_route_station(route)
    puts 'Choose station: '
    choose_by_input(route.stations, &:name)
  end

  def choose_train_type
    puts 'Choose train type: '
    choose_by_input(TRAIN_TYPES) { |type| type }
  end

  def choose_train
    puts 'Choose train: '
    choose_by_input(trains, &:number)
  end

  def choose_by_input(entities)
    entities.each_with_index { |entity, id| puts "#{id + 1} - #{yield(entity)}" }
    entities[gets.chomp.to_i - 1]
  end

  def create_train_by_type(type, number)
    case type
    when :cargo then train = CargoTrain.new number
    when :passenger then train = PassengerTrain.new number
    end

    train
  end

  def create_carriage(train)
    case train.type
    when :cargo then CargoCarriage.new
    when :passenger then PassengerCarriage.new
    else puts "Something is wrong with train ##{train.number} type"
    end
  end
end
