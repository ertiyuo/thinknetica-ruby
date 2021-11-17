# frozen_string_literal: true

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_writer :counter

    def instances
      counter
    end

    def counter
      @counter ||= 0
    end
  end

  module InstanceMethods
    private

    def register_instance
      self.class.counter += 1
    end
  end
end
