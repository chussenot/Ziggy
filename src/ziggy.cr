require "socket"

module Ziggy
  class Server
    @server : UDPSocket

    def initialize( addr : String, port : Number )
      @server = UDPSocket.new
      @server.bind addr, port
      @buffer = uninitialized UInt8[2048]
    end

    def listen (&result)
      while (1==1)
        bytes,addr  = @server.receive @buffer.to_slice
        msg = String.new(@buffer.to_slice[0,bytes])
        yield addr,msg,bytes
      end
    end

    def close
      @server.close
    end
  end
end
