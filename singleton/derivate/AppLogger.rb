require_relative 'SingletonMaker'

class AppLogger < SingletonMaker
  def initialize
    @log = File.open("applogs.txt", "a")
    Register.instance.register("AppLogger", self)
  end

  def self.instance
    return @instance = @instance || new
  end

  def add_log(message)
    @log.puts(message)
    return 'Log added'
  end
end
