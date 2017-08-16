class AppLogger < Logger
  def initialize
    @log = File.open("applogs.txt", "a")
    @instance
  end

  def self.instance
    return @instance = @instance || new
  end
end
