# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
    { first_name: 'Smitty', last_name: 'WernerJagerManJensen', email: 'hewas@numberonemrkrabs.com', mobile_phone: '8675309'}
  ])
scenarios = 10.times do
  Scenario.create(user_convinced: !rand(0..1).zero?)
end