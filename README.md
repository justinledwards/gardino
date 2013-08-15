gardino
=======

Garden control and monitoring using Dino + Rails + Arduino

Screenshot - http://i.imgur.com/z4v02l0.png

Dino - https://github.com/austinbv/dino

Currently I have no sensors located on the board yet.

The database is just SQLite right now for mobility sake.

I am using a sainsmart 8 channel relay.   You can check the configuration in `config/initializers/dino.rb` .  
All of the current code is in `app/controllers/relays_controller.rb` and `app/views/relays`.   
I am storing the state of the relays in the model and controlling the on and off with ajax post functions that 
load partials via 'turnoff' and 'turnon'.

Requirements:  you must install Redis, have an up to date ruby / rails

Installation:  `bundle install`, `rake db:migrate`, `rake db:seed`, `rails s`, modify files mentioned above to fit your needs.   

Navigate to `http://yourapp/sidekiq` to see jobs that have run or will be running.   
