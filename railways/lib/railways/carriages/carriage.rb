class Carriage
  include Vendor

  attr_reader :type

  def initialize(type)
    @type = type
  end
end
