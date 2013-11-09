#coding:utf-8
require 'em-websocket'

def getMsg(who, msg)
  return "{\"user\": \"#{who}\", \"msg\": \"#{msg}\"}"
end

EM::run do

  puts "server start"
  @channel = EM::Channel.new
  EventMachine::WebSocket.start(:host => "192.168.11.17", :port => 8080) do |ws|
    name = nil
    sid = nil

    ws.onopen { |handshake|
      if handshake.path.include? "/join" then
        sid = @channel.subscribe {|mes|
          ws.send(mes)
        }
        name = handshake.query["name"]
      end
      
      @channel.push getMsg("server", "You connected to #{handshake.path}!")
      puts "<#{name}> connected!"
    }

    ws.onmessage { |mes|
      @channel.push getMsg(name, mes)
      puts "<#{name}> #{mes}"
    }

    ws.onclose {
      @channel.unsubscribe(sid)
      @channel.push getMsg("server", "#{name} is disconnected.")
      puts "<#{name}> disconnected."
    }
  end
end


