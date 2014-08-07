# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(email: 'user@example.com', password: 'changeme')
user.add_role :customer
this_guy = User.create!(email: 'tester@example.com', password: 'changeme')
this_guy.add_role :customer
logan = User.create!(email: 'rileylog@gmail.com', password: 'password')
logan.add_role :customer
itsamemario = User.create!(email: 'alex.howington@gmail.com', password: 'wheatbox')
itsamemario.add_role :admin
admin = User.create!(email: 'admin@rwc.com', password: 'loganlogan')
admin.add_role :admin

slv_central = ListingArea.new(name: 'SLV Central', policy: 'Salt Lake Valley Central policy goes here')
slv_central.kml = File.open(File.join(Rails.root, "/test/fixtures/SLV_Central.kml"))
slv_central.save!
# ListingArea.parse_kml(slv_central.id)
slv_east = ListingArea.new(name: 'SLV East', policy: 'Salt Lake Valley East policy goes here')
slv_east.kml = File.open(File.join(Rails.root, "/test/fixtures/SLV_East.kml"))
slv_east.save!
# ListingArea.parse_kml(slv_east.id)
slv_north = ListingArea.new(name: 'SLV North', policy: 'Salt Lake Valley North policy goes here')
slv_north.kml = File.open(File.join(Rails.root, "/test/fixtures/SLV_North.kml"))
slv_north.save!
# ListingArea.parse_kml(slv_north.id)
slv_west = ListingArea.new(name: 'SLV West', policy: 'Salt Lake Valley West policy goes here')
slv_west.kml = File.open(File.join(Rails.root, "/test/fixtures/SLV_West.kml"))
slv_west.save!
# ListingArea.parse_kml(slv_west.id)

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
# PlaceOfUseArea.parse_kml(area_one.id)
area_two = PlaceOfUseArea.new(name: 'Area Two')
area_two.kml = File.open(File.join(Rails.root, "/test/fixtures/Area_2.kml"))
area_two.save!
# PlaceOfUseArea.parse_kml(area_two.id)
area_three = PlaceOfUseArea.new(name: 'Area Three')
area_three.kml = File.open(File.join(Rails.root, "/test/fixtures/Area_3.kml"))
area_three.save!
# PlaceOfUseArea.parse_kml(area_three.id)

stream = PointOfDiversion.new(name: 'Stream')
stream.kml = File.open(File.join(Rails.root, "/test/fixtures/Stream.kml"))
stream.save!
# PointOfDiversion.parse_kml(stream.id)
well = PointOfDiversion.new(name: 'Well')
well.kml = File.open(File.join(Rails.root, "/test/fixtures/Well.kml"))
well.save!
# PointOfDiversion.parse_kml(well.id)
well_two = PointOfDiversion.new(name: 'Well Two')
well_two.kml = File.open(File.join(Rails.root, "/test/fixtures/Well2.kml"))
well_two.save!
# PointOfDiversion.parse_kml(well_two.id)


water_right = WaterRight.create!(number: '13-142', flow_cfs: 5.12, flow_ac_ft: 1860, sole_supply_acres: 620, place_of_use: 'Full Farm', change_application_number: 'a28264', proof_due_date: "2016-06-30", priority_date: "1908-10-27", user_id: this_guy.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: stream.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: well.id)
water_right = WaterRight.create!(number: '13-146', flow_cfs: 8.7, flow_ac_ft: 2716.5, sole_supply_acres: 905.5, place_of_use: 'Full Farm', change_application_number: 'a28264', proof_due_date: "2016-06-30", priority_date: "1908-10-27", user_id: this_guy.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: well.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: well_two.id)
water_right = WaterRight.create!(number: '13-147', flow_cfs: 2.31, flow_ac_ft: 480, sole_supply_acres: 160, place_of_use: 'Full Farm', change_application_number: 'a28264', proof_due_date: "2016-06-30", priority_date: "1908-10-27", user_id: this_guy.id)
water_right.place_of_use_area_water_rights.create!(place_of_use_area_id: area_one.id)
water_right = WaterRight.create!(number: '13-155', flow_cfs: 7.4, flow_ac_ft: 0, sole_supply_acres: 0, place_of_use: 'Full Farm', change_application_number: 'a28264', proof_due_date: "2016-06-30", priority_date: "1908-10-27", user_id: this_guy.id)
water_right.place_of_use_area_water_rights.create!(place_of_use_area_id: area_two.id)
water_right = WaterRight.create!(number: '13-198', flow_cfs: 1.11, flow_ac_ft: 475.08, sole_supply_acres: 179.8, place_of_use: 'Sec 19 & 20', proof_due_date: "2015-05-31", priority_date: "1972-07-17", user_id: this_guy.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: stream.id)
water_right.place_of_use_area_water_rights.create!(place_of_use_area_id: area_three.id)
water_right = WaterRight.create!(number: '13-1138', flow_cfs: 10, flow_ac_ft: 1920, sole_supply_acres: 640, place_of_use: 'Most Farm', change_application_number: 'a28259', proof_due_date: "2015-05-31", priority_date: "1972-07-17", user_id: this_guy.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: well.id)
water_right.place_of_use_area_water_rights.create!(place_of_use_area_id: area_one.id)





one = PointOfDiversion.new(name: '57-3411_1')
one.kml = File.open(File.join(Rails.root, "/test/fixtures/57-3411_1.kml"))
one.save!
# PointOfDiversion.parse_kml(one.id)
two = PointOfDiversion.new(name: '57-3411_2')
two.kml = File.open(File.join(Rails.root, "/test/fixtures/57-3411_2.kml"))
two.save!
# PointOfDiversion.parse_kml(two.id)
three = PointOfDiversion.new(name: '57-3411_3')
three.kml = File.open(File.join(Rails.root, "/test/fixtures/57-3411_3.kml"))
three.save!
# PointOfDiversion.parse_kml(three.id)
four = PointOfDiversion.new(name: '57-3411_4')
four.kml = File.open(File.join(Rails.root, "/test/fixtures/57-3411_4.kml"))
four.save!
# PointOfDiversion.parse_kml(four.id)
five = PointOfDiversion.new(name: '57-3411_5')
five.kml = File.open(File.join(Rails.root, "/test/fixtures/57-3411_5.kml"))
five.save!
# PointOfDiversion.parse_kml(five.id)
six = PointOfDiversion.new(name: '57-3411_6')
six.kml = File.open(File.join(Rails.root, "/test/fixtures/57-3411_6.kml"))
six.save!
# PointOfDiversion.parse_kml(six.id)
seven = PointOfDiversion.new(name: '57-3411_7')
seven.kml = File.open(File.join(Rails.root, "/test/fixtures/57-3411_7.kml"))
seven.save!
# PointOfDiversion.parse_kml(seven.id)
eight = PointOfDiversion.new(name: '57-3411_8')
eight.kml = File.open(File.join(Rails.root, "/test/fixtures/57-3411_8.kml"))
eight.save!
# PointOfDiversion.parse_kml(eight.id)
nine = PointOfDiversion.new(name: '57-3411_9')
nine.kml = File.open(File.join(Rails.root, "/test/fixtures/57-3411_9.kml"))
nine.save!
# PointOfDiversion.parse_kml(nine.id)
ten = PointOfDiversion.new(name: '57-3411_10')
ten.kml = File.open(File.join(Rails.root, "/test/fixtures/57-3411_10.kml"))
ten.save!
# PointOfDiversion.parse_kml(ten.id)
eleven = PointOfDiversion.new(name: '57-3411_11')
eleven.kml = File.open(File.join(Rails.root, "/test/fixtures/57-3411_11.kml"))
eleven.save!
# PointOfDiversion.parse_kml(eleven.id)

water_right = WaterRight.create!(number: '57-3411', priority_date: "1880-01-01", change_application_number: 'a37915', proof_due_date: "2017-04-30", flow_ac_ft: 7040, place_of_use: 'Municipal', comments: 'Board of Water Resources on this change', user_id: logan.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: one.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: two.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: three.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: four.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: five.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: six.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: seven.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: eight.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: nine.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: ten.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: eleven.id)
water_right = WaterRight.create!(number: '57-443', priority_date: "1940-09-05", change_application_number: 'a37915', proof_due_date: "2017-04-30", flow_cfs: 1.4, place_of_use: 'Municipal', user_id: logan.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: one.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: two.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: three.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: four.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: five.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: six.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: seven.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: eight.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: nine.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: ten.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: eleven.id)
water_right = WaterRight.create!(number: '57-10191', priority_date: "1908-10-27", change_application_number: 'a37915', proof_due_date: "2017-04-30", flow_ac_ft: 2465.36, place_of_use: 'Municipal', user_id: logan.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: one.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: two.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: three.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: four.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: five.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: six.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: seven.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: eight.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: nine.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: ten.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: eleven.id)


two_one = PointOfDiversion.new(name: '57-10327_1')
two_one.kml = File.open(File.join(Rails.root, "/test/fixtures/57-10327_1.kml"))
two_one.save!
# PointOfDiversion.parse_kml(two_one.id)
two_two = PointOfDiversion.new(name: '57-10327_2')
two_two.kml = File.open(File.join(Rails.root, "/test/fixtures/57-10327_2.kml"))
two_two.save!
# PointOfDiversion.parse_kml(two_two.id)
two_three = PointOfDiversion.new(name: '57-10327_3')
two_three.kml = File.open(File.join(Rails.root, "/test/fixtures/57-10327_3.kml"))
two_three.save!
# PointOfDiversion.parse_kml(two_three.id)
two_four = PointOfDiversion.new(name: '57-10327_4')
two_four.kml = File.open(File.join(Rails.root, "/test/fixtures/57-10327_4.kml"))
two_four.save!
# PointOfDiversion.parse_kml(two_four.id)

water_right = WaterRight.create!(number: '57-10327', priority_date: "1972-06-13", change_application_number: 'a37441', proof_due_date: "2022-09-30", flow_ac_ft: 23.4, place_of_use: 'Municipal', comments: "Proof due date is end of 50-yr period; seg'd from 57-7833", user_id: logan.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: two_one.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: two_two.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: two_three.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: two_four.id)
water_right = WaterRight.create!(number: '57-7839', priority_date: "1972-07-17", change_application_number: 'a38167', proof_due_date: "2017-08-31", flow_ac_ft: 25.856, place_of_use: 'Municipal', user_id: logan.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: two_one.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: two_two.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: two_three.id)
water_right.point_of_diversion_water_rights.create!(point_of_diversion_id: two_four.id)

