gardino
=======

Garden control and monitoring using Dino + Rails + Arduino

Currently I have no sensors located on the board yet.

The database is just SQLite right now for mobility sake.

I am using a sainsmart 8 channel relay.   You can check the configuration in `config/initializers/dino.rb` .  
All of the current code is in `app/controllers/relays_controller.rb` and `app/views/relays`.   
I am storing the state of the relays in the model and controlling the on and off with ajax post functions that 
load partials via 'turnoff' and 'turnon'.

