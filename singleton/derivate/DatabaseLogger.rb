require_relative 'SingletonMaker'

class DatabaseLogger < SingletonMaker
  def initialize
    @log = File.open("dblogs.txt", "a")
    Register.instance.register('DatabaseLogger', self)
  end

  def self.instance
    return @instance = @instance || new
  end

  def add_log(message)
    @log.puts(message)
    return 'Log added'
  end
end
