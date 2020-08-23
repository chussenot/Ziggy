require "socket"

module Ziggy
  class Server
    # Create server
    def initialize
      @server = UDPSocket.new
      @server.bind "localhost", 1234
      loop do
        begin
          puts @server.gets
        rescue ex
          STDERR.puts(ex)
        end
      end
    end

    def close
      @server.close
    end
  end
end
