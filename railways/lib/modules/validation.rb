# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validate(attribute, validation_type, params = nil)
      validations = instance_variable_get('@validations') || {}
      attribute_validations = validations[attribute] || {}

      attribute_validations[validation_type] = params
      validations[attribute] = attribute_validations
      instance_variable_set('@validations', validations)
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue RuntimeError => e
      puts e.message
      false
    end

    protected

    def validate!
      class_validations = self.class.instance_variable_get('@validations')
      return true if class_validations.nil?

      class_validations.each do |attribute, validations|
        validations.each do |type, params|
          send "validate_#{type}", instance_variable_get("@#{attribute}"), params
        rescue RuntimeError => e
          raise "#{attribute.capitalize}: #{e.message}"
        end
      end
    end

    private

    def validate_presence(variable, *)
      raise 'not present' if variable.nil? || variable.empty?
    end

    def validate_format(variable, format)
      raise 'wrong format' unless variable =~ format
    end

    def validate_type(variable, type)
      raise 'wrong type' if variable.class != type
    end
  end
end
