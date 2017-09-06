# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: "dezignsuitemohali@gmail.com", password: "Akshayakshay1995")
courses = ["Android","PHP","Web Designing","ASP .NET","College/University workshop","School Workshop","Corporate Workshop"]
courses.each do |course|
	Course.create!(name: course)
end