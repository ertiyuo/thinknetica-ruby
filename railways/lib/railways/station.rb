# Класс Station (Станция)
class Station
  include InstanceCounter

  attr_reader :trains, :name

  # Имеет название, которое указывается при ее создании
  def initialize(name)
    @trains = []
    @name = name
    validate!

    register_instance
    self.class.stations << self
  end

  # Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых
  def cargo_trains
    trains.filter { |train| train.type == :cargo }
  end

  # Может возвращать список поездов на станции по типу (см. ниже): кол-во пассажирских
  def passenger_trains
    trains.filter { |train| train.type == :passenger }
  end

  # Может принимать поезда (по одному за раз)
  def arrive_train(train)
    trains << train
  end

  # Может отправлять поезда (по одному за раз - при этом поезд удаляется из списка поездов, находящихся на станции).
  def departure_train(train)
    trains.delete train
  end

  def each_train(&block)
    trains.each do |train|
      block.call train
    end
  end

  def self.stations
    @stations ||= []
  end

  def self.all
    @stations
  end

  def valid?
    validate!
    true
  rescue RuntimeError
    false
  end

  protected

  def validate!
    raise 'Name should not be empty' if name == ''
  end
end
