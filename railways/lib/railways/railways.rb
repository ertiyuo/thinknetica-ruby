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
    print_trains: 'print trains on station',

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
    puts 'create station'
    # puts "Station name: "
    # name = gets.chomp
    # stations << Station.new(name)
  end

  def print_stations
    puts 'print stations'
  end

  def print_trains
    puts 'print station trains'
  end

  def create_route
    puts 'create route'
  end

  def add_station
    puts 'add station'
  end

  def remove_station
    puts 'remove station'
  end

  def create_train
    puts 'create train'
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
end
