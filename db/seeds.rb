# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
prepare_production_data = true
prepare_test_data = false

if prepare_production_data
  User.new(email: '327110424@163.com', password: 'admin', name: 'admin', role: User.roles[:admin]).save!
end

if prepare_test_data
end