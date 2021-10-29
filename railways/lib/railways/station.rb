# Класс Station (Станция)
class Station
  include InstanceCounter

  attr_reader :trains, :name

  # Имеет название, которое указывается при ее создании
  def initialize(name)
    @name = name
    @trains = {
      cargo: [],
      passenger: []
    }

    register_instance

    self.class.stations << self
  end

  # Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых
  def cargo_trains
    trains[:cargo]
  end

  # Может возвращать список поездов на станции по типу (см. ниже): кол-во пассажирских
  def passenger_trains
    trains[:passenger]
  end

  # Может принимать поезда (по одному за раз)
  def arrive_train(train)
    case train.type
    when :cargo then trains[:cargo] << train
    when :passenger then trains[:passenger] << train
    end

    puts "Train ##{train.number} arrived at #{name}. "
  end

  # Может отправлять поезда (по одному за раз - при этом поезд удаляется из списка поездов, находящихся на станции).
  def departure_train(train)
    trains[train.type].delete train
  end

  def self.stations
    @stations ||= []
  end

  def self.all
    @stations
  end
end
