# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end
  class ValidationError < StandardError; end

  module ClassMethods
    def validate(*args)
      @valids ||= []
      @valids << args
    end
  end

  module InstanceMethods
    def validate!
      self.class.class_eval('@valids').each do |value|
        send(value[1].to_sym, instance_variable_get("@#{value[0]}".to_sym), value[2])
      end
    end

    def valid?
      validate!
      true
    rescue ValidationError
      false
    end

    private

    def presence(variable, _argument)
      raise ValidationError, "can't be empty or nil" if variable.empty? || variable.nil?
    end

    def format(variable, argument)
      raise ValidationError, 'Invalin number format' if variable !~ argument
    end

    def type(variable, argument)
      raise ValidationError, 'Wrong class' if variable.class != argument
    end
  end
end
