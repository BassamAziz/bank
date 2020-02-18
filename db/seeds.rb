# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

accounts = FactoryBot.create_list(:account, 10)

accounts.each do |account|
    FactoryBot.create_list(:transaction, 10, to: account)
    FactoryBot.create_list(:transaction, 10, from: account)
end