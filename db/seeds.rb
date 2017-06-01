# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(username:  "admin",
             password:              "admin",
             password_confirmation: "admin",
             admin: true,
             name:  "ADMIN",
             birthday:  "May 6, 1988",
             contact_no:  "0",
             account_no:  "12343435346363433",
             bank:  "BDO",
             base_salary:  "18000",
             no_of_dependents: "0",
             status: "Single"
             )

99.times do |n|
  name  = Faker::Name.name
  username = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               username:  username,
               password:              password,
               password_confirmation: password,
               status:              "Single",
               base_salary:         Random::rand(30000) + 12000,
               bank: ["BDO", "BPI", "Metrobank", "Unionbank", "PSBank"].sample,
               account_no: Faker::Number.number(10),
               no_of_dependents: "0"
               )
end