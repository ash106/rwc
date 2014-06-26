# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(email: 'user@example.com', password: 'changeme')
user.add_role :user
user = User.create!(email: 'tester@example.com', password: 'changeme')
user.add_role :user
user = User.create!(email: 'rileylog@gmail.com', password: 'changeme')
user.add_role :admin
user = User.create!(email: 'alex.howington@gmail.com', password: 'changeme')
user.add_role :admin
