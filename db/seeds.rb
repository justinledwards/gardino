# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


lights = Relay.create( name: 'Lights',  pin: '2', number: '1', status: 'on' )
pumps = Relay.create( name: 'Pumps',  pin: '3', number: '2', status: 'on' )