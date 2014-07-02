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

slv_central = ListingArea.new(name: 'SLV Central', policy: 'Salt Lake Valley Central policy goes here')
slv_central.kml = File.open(File.join(Rails.root, "/test/fixtures/SLV_Central.kml"))
slv_central.save!
ListingArea.parse_kml(slv_central.id)
slv_east = ListingArea.new(name: 'SLV East', policy: 'Salt Lake Valley East policy goes here')
slv_east.kml = File.open(File.join(Rails.root, "/test/fixtures/SLV_East.kml"))
slv_east.save!
ListingArea.parse_kml(slv_east.id)
slv_north = ListingArea.new(name: 'SLV North', policy: 'Salt Lake Valley North policy goes here')
slv_north.kml = File.open(File.join(Rails.root, "/test/fixtures/SLV_North.kml"))
slv_north.save!
ListingArea.parse_kml(slv_north.id)
slv_west = ListingArea.new(name: 'SLV West', policy: 'Salt Lake Valley West policy goes here')
slv_west.kml = File.open(File.join(Rails.root, "/test/fixtures/SLV_West.kml"))
slv_west.save!
ListingArea.parse_kml(slv_west.id)

Wanted.create!(volume: 20, source: 'Surface', description: 'Need 5 to 20 acre feet of Strawberry Water.', listing_area_id: slv_central.id)
Wanted.create!(volume: 100, source: 'Surface', description: 'Need water from irrigation companies that take water from the Spanish Fork River or Strawberry Water.', listing_area_id: slv_central.id)
Wanted.create!(volume: 40, source: 'Surface or Well', description: 'Need 30 to 40 acre-feet to move to a combination of well and Provo River water. Washington and South Kamas shares will work, however, 1st class Provo River rights are preferred.', listing_area_id: slv_north.id)
Wanted.create!(volume: 15, source: 'Well', description: 'Need 10 to 20 acre-feet of water and will only purchase based on approved change application', listing_area_id: slv_north.id)
Wanted.create!(volume: 10, source: 'Well', description: 'Need this water for a few lots in a development.', listing_area_id: slv_north.id)

ForSale.create!(volume: 100, source: 'Well', description: 'This can be moved throughout most of this area', price: 4000, listing_area_id: slv_central.id)
ForSale.create!(volume: 27, source: 'Well', description: 'Seller is willing to sell portions or all.', price: 3800, listing_area_id: slv_east.id)
ForSale.create!(volume: 36, source: 'Well', description: 'This is certificated water in Rush Valley and can move anywhere in Rush Valley', price: 3000, listing_area_id: slv_east.id)
ForSale.create!(volume: 74, source: 'Surface', description: 'This is based on North Jordan Shares that can transfer to this area to a well.', price: 3100, listing_area_id: slv_west.id)
ForSale.create!(volume: 300, source: 'Mona Res.', description: 'This is based on shares in Goshen Irrigation Company.', price: 6500, listing_area_id: slv_west.id)
ForSale.create!(volume: 16, source: 'Provo River', description: 'This is 1st class Provo River water that is located in the Midway Area.', price: 10000, listing_area_id: slv_west.id)

area_one = PlaceOfUseArea.new(name: 'Area One')
area_one.kml = File.open(File.join(Rails.root, "/test/fixtures/Area_1.kml"))
area_one.save!
PlaceOfUseArea.parse_kml(area_one.id)
area_two = PlaceOfUseArea.new(name: 'Area Two')
area_two.kml = File.open(File.join(Rails.root, "/test/fixtures/Area_2.kml"))
area_two.save!
PlaceOfUseArea.parse_kml(area_two.id)
area_three = PlaceOfUseArea.new(name: 'Area Three')
area_three.kml = File.open(File.join(Rails.root, "/test/fixtures/Area_3.kml"))
area_three.save!
PlaceOfUseArea.parse_kml(area_three.id)

stream = PointOfDiversion.new(name: 'Stream')
stream.kml = File.open(File.join(Rails.root, "/test/fixtures/Stream.kml"))
stream.save!
PointOfDiversion.parse_kml(stream.id)
well = PointOfDiversion.new(name: 'Well')
well.kml = File.open(File.join(Rails.root, "/test/fixtures/Well.kml"))
well.save!
PointOfDiversion.parse_kml(well.id)
well_two = PointOfDiversion.new(name: 'Well Two')
well_two.kml = File.open(File.join(Rails.root, "/test/fixtures/Well2.kml"))
well_two.save!
PointOfDiversion.parse_kml(well_two.id)

WaterRight.create!(number: '13-142', flow_cfs: 5.12, flow_ac_ft: 1860, sole_supply_acres: 620, place_of_use: 'Full Farm', change_application_number: 'a28264', proof_due_date: "2016-06-30")
WaterRight.create!(number: '13-146', flow_cfs: 8.7, flow_ac_ft: 2716.5, sole_supply_acres: 905.5, place_of_use: 'Full Farm', change_application_number: 'a28264', proof_due_date: "2016-06-30")
WaterRight.create!(number: '13-147', flow_cfs: 2.31, flow_ac_ft: 480, sole_supply_acres: 160, place_of_use: 'Full Farm', change_application_number: 'a28264', proof_due_date: "2016-06-30")
WaterRight.create!(number: '13-155', flow_cfs: 7.4, flow_ac_ft: 0, sole_supply_acres: 0, place_of_use: 'Full Farm', change_application_number: 'a28264', proof_due_date: "2016-06-30")
WaterRight.create!(number: '13-198', flow_cfs: 1.11, flow_ac_ft: 475.08, sole_supply_acres: 179.8, place_of_use: 'Sec 19 & 20')
WaterRight.create!(number: '13-1138', flow_cfs: 10, flow_ac_ft: 1920, sole_supply_acres: 640, place_of_use: 'Most Farm', change_application_number: 'a28259', proof_due_date: "2015-05-31")


