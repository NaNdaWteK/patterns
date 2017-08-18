class Register

  def initialize
    @singletons = Hash.new
  end

  def self.instance
    if(@instance.nil?)
      return @instance = new
    end
    return @instance
  end

  def register(name, singleton)
    @singletons[name] = singleton
  end

  def lookup(name)
    @singletons[name]
  end

  private_class_method :new
end
