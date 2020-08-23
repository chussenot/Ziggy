require "./spec_helper"

describe Ziggy do
  it "works" do
    false.should eq(false)
    server = Ziggy::Server.new "localhost", 1234
    client = UDPSocket.new
    client.connect "localhost", 1234
    client.puts "foo"
    client.puts "foo2"

    server.listen do |addr,msg,bytes|
      puts "\nMessage from: #{addr}\n"
      puts "\nMessage: #{msg}\n"
    end
    server.close
  end
end
