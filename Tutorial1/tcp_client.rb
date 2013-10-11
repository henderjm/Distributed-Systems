require 'socket'
require 'json'

# To change this template use File | Settings | File Templates.

socket = TCPSocket.new 'localhost', 8081

begin
  file = ARGV.shift # handy little trick found online to move along the arguments

  #C:/Users/henderjm/RubymineProjects/Tutorial1/test.txt   ... for home test use only
  File.open("C:/Users/henderjm/RubymineProjects/Tutorial1/test.txt", 'rb') do |file|
    chunk = file.read # read in entirety
    socket.puts(chunk) # send stream to server
   # socket.sleep(1)   # just ignore this
    socket.puts("EOF")

    puts "data sent" # data is sent
    line = "" # to avoid NilClass occurring ... probably not supposed to do it this way :/
    line = socket.gets # lines from socket
    socket.close # no need to stay connected anymore
    h = Hash.new("Freqs")
    h = eval(line) # put string content into hash using eval ... apparently another cheat, works though
    puts "Word Frequency is"
    if ARGV.empty?
      h.each { |key, value| puts "#{key} is #{value}" } # pretty print
    else
      ARGV.each do |a|
        b = a
        puts "#{b} is #{h[b]}" if h.has_key? b
      end
    end
  end
rescue EOFError
end
puts "\n!!!Connection Closed!!!"
