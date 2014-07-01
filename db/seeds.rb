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

listing_area = ListingArea.new(name: 'SLV Central', policy: 'Salt Lake Valley Central policy goes here')
listing_area.kml = File.open(File.join(Rails.root, "/test/fixtures/SLV_Central.kml"))
listing_area.save!
ListingArea.parse_kml(listing_area.id)
listing_area = ListingArea.new(name: 'SLV East', policy: 'Salt Lake Valley East policy goes here')
listing_area.kml = File.open(File.join(Rails.root, "/test/fixtures/SLV_East.kml"))
listing_area.save!
ListingArea.parse_kml(listing_area.id)
listing_area = ListingArea.new(name: 'SLV North', policy: 'Salt Lake Valley North policy goes here')
listing_area.kml = File.open(File.join(Rails.root, "/test/fixtures/SLV_North.kml"))
listing_area.save!
ListingArea.parse_kml(listing_area.id)
listing_area = ListingArea.new(name: 'SLV West', policy: 'Salt Lake Valley West policy goes here')
listing_area.kml = File.open(File.join(Rails.root, "/test/fixtures/SLV_West.kml"))
listing_area.save!
ListingArea.parse_kml(listing_area.id)
