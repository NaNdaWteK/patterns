require_relative 'Register'
require 'singleton'

class SingletonMaker
  include Singleton

  def self.instance(type = nil)
    if(Register.instance.lookup(type).nil?)
      concrete_singleton = Object.const_get(type)
      concrete_singleton.instance
    end
    return Register.instance.lookup(type)
  end

  private_class_method :new
end
