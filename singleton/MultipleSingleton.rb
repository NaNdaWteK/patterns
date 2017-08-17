class MultipleSingleton
  
  MAXIMUN_INSTANCES = 3

  def self.instance
    turn = actual
    @instances = @instances || Array.new
    if(@instances.size < MAXIMUN_INSTANCES)
      @instances.push(new)
    end
    return @instances[turn]
  end

  def self.actual
    return @turn = 0 if @turn.nil? || @turn >= 2
    @turn = @turn + 1
  end

  private_class_method :new
end
