# frozen_string_literal: true

class Carriage
  include Vendor
  include Validation

  extend Accessors

  attr_accessor_with_history :number, :type, :occupied

  validate :type, :format, /^cargo$|^passenger$/i

  def initialize(type, space)
    @number = rand(1..20)
    @type = type

    @space = space
    @occupied = 0

    validate!
  end

  def take_space(amount)
    raise 'No more space!' if free.zero?

    self.occupied += amount
  end

  def free
    @space - occupied
  end
end
