begin
  $dinoconnector = Dino::TxRx::TCP.new("192.168.50.11")
  $homegarduino = Dino::Board.new($dinoconnector)
  $relay1 = Dino::Components::Led.new(pin: 2, board: $homegarduino)
  $relay2 = Dino::Components::Led.new(pin: 3, board: $homegarduino)
  $relay3 = Dino::Components::Led.new(pin: 4, board: $homegarduino)
  $relay4 = Dino::Components::Led.new(pin: 5, board: $homegarduino)
  $relay5 = Dino::Components::Led.new(pin: 6, board: $homegarduino)
  $relay6 = Dino::Components::Led.new(pin: 7, board: $homegarduino)
  $relay7 = Dino::Components::Led.new(pin: 8, board: $homegarduino)
  $relay8 = Dino::Components::Led.new(pin: 9, board: $homegarduino)

  availablerelays = [$relay1,$relay2,$relay3,$relay4,$relay5,$relay6,$relay7,$relay8]
  availablerelays.each do |r|
    puts r.pin
  end
  


rescue Dino::BoardNotFound
  puts 'The board is not connected'
end
