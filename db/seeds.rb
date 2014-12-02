# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(first_name:"Brianne", last_name:"Guster", image_path:"brianne_on_a_seat.jpg")
User.create(first_name:"Chelsea", last_name:"King", image_path:"chelsea_with_cake.png")

Event.create(host_id:1, name:"New Years Eve Eve", details:"Start New Year's Eve off the right way")