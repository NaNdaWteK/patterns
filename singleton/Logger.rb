class Logger
  def initialize
    @log = File.open("logs.txt", "a")
    @instance
  end

  def self.instance(type = nil)
    if(type.nil?)
      return @instance = @instance || new
    end
    class_generate = Object.const_get(type)
    return class_generate.instance
  end

  def add_log(message)
    @log.puts(message)
    return 'Log added'
  end

  private_class_method :new
end
