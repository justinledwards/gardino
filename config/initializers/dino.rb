begin
  Gardino::Application.config.board = Dino::Board.new(Dino::TxRx.new)
  #$dinoconnector = Dino::TxRx::TCP.new("192.168.50.11")
  #Gardino::Application.config.board = Dino::Board.new(Dino::TxRx::Serial.new)
  #Gardino::Application.config.board = Dino::Board.new($dinoconnector)

  #$sensor1 = Dino::Components::Sensor.new(pin: 'A0', board: Gardino::Application.config.board)
  #$sensor1.read { |value| puts "Temperature is #{(((value.to_f * 0.004882814) - 0.5) * 100) * (9.0/5.0) + 32.00}F" }

  availablerelays = Relay.all
  availablerelays.each do |r|
    rnum = r.number
    rpin = r.pin
    eval("$relay#{rnum} = Dino::Components::Led.new(pin: rpin, board: Gardino::Application.config.board)")
    relay = eval("$relay#{rnum}")
    if r.status == "off"
      relay.off
    else
      relay.on
    end

    puts r.name
  end

  availablesensors = Sensor.all
  availablesensors.each do |s|
    snum = s.number
    spin = s.pin
    stype = s.sensor_type
    if stype == "DHT"
      eval("$sensor#{snum}temp = Dino::Components::DHT::Temperature.new(pin: spin, board: Gardino::Application.config.board)")
      eval("$sensor#{snum}humidity = Dino::Components::DHT::Humidity.new(pin: spin, board: Gardino::Application.config.board)")
    end
    puts "#{s.name}"

    
  end
  


rescue Dino::BoardNotFound
  puts 'The board is not connected'
end

# 10000.times { 
#   rnum = [1, 2, 3, 4, 5, 6, 7, 8].sample

#   relay = eval("$relay#{rnum}")
#   onoroff = ["on", "off"].sample
#   if onoroff == "on"
#     relay.on
#   else
#     relay.off
#   end
# }
