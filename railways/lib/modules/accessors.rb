# frozen_string_literal: true

module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*variable_names)
      variable_names.each do |name|
        define_setter(name)
        define_getter(name)
        define_history_getter(name)
      end
    end

    def strong_attr_accessor(variable_name, variable_type)
      define_getter(variable_name)
      define_strong_setter(variable_name, variable_type)
    end

    private

    def define_getter(name)
      define_method(name) do
        instance_variable_get("@#{name}")
      end
    end

    def define_history_getter(name)
      define_method("#{name}_history") do
        instance_variable_get("@#{name}_history")
      end
    end

    def define_setter(name)
      define_method("#{name}=") do |value|
        history = instance_variable_get("@#{name}_history") || [instance_variable_get("@#{name}")]

        instance_variable_set("@#{name}", value)
        instance_variable_set("@#{name}_history", history << value)
      end
    end

    def define_strong_setter(variable_name, class_name)
      define_method("#{variable_name}=") do |value|
        raise "#{variable_name} should be of type #{class_name}" if value.class != class_name

        instance_variable_set("@#{variable_name}", value)
      end
    end
  end
end
