class Carriage
  include Vendor

  attr_reader :type

  def initialize(type)
    @type = type
    validate!
  end

  def number
    rand(1..20)
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
