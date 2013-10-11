require 'socket'
Socket.tcp_server_loop(8081) do |conn, addr|
  Thread.new do
    client = "#{addr.ip_address}:#{addr.ip_port}"
    puts "#{client} is connected"
    begin
      h = Hash.new("Word Frequency")
      loop do

          #while chunk = conn.read
          chunk = conn.readline
          #puts chunk
          while (!(chunk == "EOF\n")) #Keep going till EOF appended to end of file on client side
            word = chunk.upcase.split(/\.?,?\s+/) # split on special characters
            for s in word       # iterate array of words in chunk
              if h.has_key? s   # if word is in hash table
                value = h[s] + 1
                h[s] = value    # update value
              else
                h.store(s, 1)   # else it is a new word, store in hash with set value 1
              end
            end
            chunk = conn.readline  # get next chunk
          end
          conn.puts h.to_s #write back to client
        break
      end
      puts "Closing connection\n"
      conn.close
      h.clear
    rescue EOFError
      conn.close
      puts "#{client} has disconnected"
    end
  end
end