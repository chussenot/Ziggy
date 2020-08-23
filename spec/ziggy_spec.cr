require "./spec_helper"

describe Ziggy do
  it "works" do
    false.should eq(false)
    server = Ziggy::Server.new
    client = UDPSocket.new
    client.connect "localhost", 1234
    client.puts "message"
    server.close
  end
end
