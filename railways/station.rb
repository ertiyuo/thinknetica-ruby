# Класс Station (Станция)
class Station
  # Может возвращать список всех поездов, находящихся в текущий момент на станции
  attr_reader :trains
  attr_reader :name

  # Имеет название, которое указывается при ее создании
  def initialize(name)
    @name = name
    @trains = {
      cargo: [],
      passenger: []
    }
  end

  # Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых
  def cargo_trains
    @trains[:cargo]
  end

  # Может возвращать список поездов на станции по типу (см. ниже): кол-во пассажирских
  def passenger_trains
    @trains[:passenger]
  end

  # Может принимать поезда (по одному за раз)
  def arrive_train(train)
    case train.type
    when :cargo then @trains[:cargo] << train
    when :passenger then @trains[:passenger] << train
    end
  end

  # Может отправлять поезда (по одному за раз - при этом поезд удаляется из списка поездов, находящихся на станции).
  def departure_train(train)
    @trains[train.type].delete train
  end
end
