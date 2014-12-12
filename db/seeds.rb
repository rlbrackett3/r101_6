# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#I added some seed stuff here to make it easier to play around, you can run rake db:setup to load this
puts "Create a test User"
User.create(fname: "Foo", lname: "Bar", username: "foobar", email: "foo@bar.com", password: "foobar")
puts "User created successfully"

puts "Create some Boards"
5.times do |i|
  Board.create(name: "Board Number #{i}", description: "There are cool things here")
end
puts " Boards created successfully"

puts "Create some Topics"
10.times do |i|
  Topic.create(title: "Topic #{i}", body: "My random through number #{i}")
end
puts " Topics created successfully"
