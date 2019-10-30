# frozen_string_literal: true

module MyAttr
  def attr_accessor_with_history(*names)
    names.each do |name|
      history = "@#{name}".to_sym
      var_name = "@#{name}".to_sym
      history = []
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        history << value
        instance_variable_set(var_name, value)
      end
      define_method("#{name}_history") { history }
    end
  end

  def strong_attr_accessor(name, base)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      raise ArgumentError, 'Wrong class of value' unless value.class == base

      instance_variable_set(var_name, value)
    end
  end
end

class Test
  extend MyAttr

  attr_accessor_with_history :a, :b, :c

  strong_attr_accessor :w, Array
end
