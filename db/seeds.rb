# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

DatabaseCleaner.clean_with(:truncation)

users = []
events = []
attendances = []

puts "Users incrementation"
12.times do |x|
    user = User.create(email: "mail#{x}@yopmail.com", encrypted_password: "TEST", description: Faker::Lorem.sentence(word_count: 50, supplemental: false, random_words_to_add: 4), first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
    users << user
end
tp User.all
puts "Users created"

puts "Events incrementation"
6.times do |x|
    event = Event.create(start_date: Faker::Date.forward(days: 23), duration: 5* rand(1..80), title: Faker::Beer.name, description: Faker::Hipster.sentence(word_count: 10, supplemental: true), price: rand(1..1000), location: Faker::Address.city, admin_id: users[rand(0..11)].id)
    events << event
end
tp Event.all
puts "Events created"

puts "Attendances incrementation"
10.times do |x|
    attendance = Attendance.create(stripe_customer_id: rand(1..10), event_id: events[rand(0..5)].id, participant_id: users[rand(0..11)].id)
    attendances << attendance
end
tp Attendance.all