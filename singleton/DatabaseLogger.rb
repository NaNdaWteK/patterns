require_relative 'Logger'
class DatabaseLogger < Logger
  def initialize
    @log = File.open("dblogs.txt", "a")
    @instance
  end

  def self.instance
    return @instance = @instance || new
  end
end
