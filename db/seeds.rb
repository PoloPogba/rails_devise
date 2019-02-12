# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Destroying users"
User.destroy_all
puts "Users destroyed\n"
puts "Destroying events"
Event.destroy_all
puts "Events destroyed\n"
puts "Destroying Attendances"
Attendance.destroy_all
puts "Attendances destroyed\n"

10.times do 
	User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::BojackHorseman.quote)
end

10.times do 
	Event.create!(start_date: Faker::Date.forward(203), duration: 50, title: Faker::Pokemon.name, description: Faker::Hacker.say_something_smart, price: 40, location: Faker::Address.city, admin:User.all.sample)

end

10.times do 
	Attendance.create!(stripe_customer_id: Faker::BreakingBad.character, user:User.all.sample, event:Event.all.sample)
end