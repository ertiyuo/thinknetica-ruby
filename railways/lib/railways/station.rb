# frozen_string_literal: true

# Класс Station (Станция)
class Station
  include InstanceCounter
  include Validation

  extend Accessors

  attr_reader :trains

  attr_accessor_with_history :name

  validate :name, :presence

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
    trains.each(&block)
  end

  def self.stations
    @stations ||= []
  end

  def self.all
    @stations
  end
end
