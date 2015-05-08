# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Event.create(name: "Event 1", start: DateTime.now, end: DateTime.now, location: "Location 1")


User.create(name: 'Jack', email: 'jack23@email.com'    )
User.create(name: 'Jill', email: 'jill24@email.com'    )

Event.find(1).users << User.find(1)
Event.find(1).users << User.find(2)


