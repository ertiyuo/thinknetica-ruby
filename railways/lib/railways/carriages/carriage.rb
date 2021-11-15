class Carriage
  include Vendor

  attr_reader :type, :number, :occupied

  def initialize(type, space)
    @number = rand(1..20)
    @type = type

    @space = space
    @occupied = 0

    validate!
  end

  def take_space(amount)
    raise 'No more space!' if free.zero?

    @occupied += amount
  end

  def free
    @space - occupied
  end

  def valid?
    validate!
    true
  rescue RuntimeError
    false
  end

  protected

  def validate!
    raise 'Wrong train type' unless TYPES.include? type
  end
end
