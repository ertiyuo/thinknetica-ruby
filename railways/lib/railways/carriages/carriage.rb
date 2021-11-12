class Carriage
  include Vendor

  attr_reader :type, :number

  def initialize(type)
    @number = rand(1..20)
    @type = type

    validate!
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
