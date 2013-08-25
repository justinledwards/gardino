begin
#  $dinoconnector = Dino::TxRx::TCP.new("192.168.50.11")
  $homegardino = Dino::Board.new(Dino::TxRx::Serial.new)
#  $homegardino = Dino::Board.new($dinoconnector)
  $relay1 = Dino::Components::Led.new(pin: 2, board: $homegardino)
  $relay2 = Dino::Components::Led.new(pin: 3, board: $homegardino)
  $relay3 = Dino::Components::Led.new(pin: 4, board: $homegardino)
  $relay4 = Dino::Components::Led.new(pin: 5, board: $homegardino)
  $relay5 = Dino::Components::Led.new(pin: 6, board: $homegardino)
  $relay6 = Dino::Components::Led.new(pin: 7, board: $homegardino)
  $relay7 = Dino::Components::Led.new(pin: 8, board: $homegardino)
  $relay8 = Dino::Components::Led.new(pin: 9, board: $homegardino)
  $sensor1 = Dino::Components::Sensor.new(pin: 'A0', board: $homegardino)
  $sensor1.read { |value| puts "Temperature is #{(((value.to_f * 0.004882814) - 0.5) * 100) * (9.0/5.0) + 32.00}F" }

  availablerelays = [$relay1,$relay2,$relay3,$relay4,$relay5,$relay6,$relay7,$relay8]
  availablerelays.each do |r|
    puts r.pin
  end
  


rescue Dino::BoardNotFound
  puts 'The board is not connected'
end
