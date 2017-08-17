require 'singleton'

class SingletonLogger
    include Singleton

    def initialize
        @log = File.open("singletonlogs.txt", "a")
    end

    def add_log(msg)
        @log.puts(msg)
        return 'Log added'
    end
end
