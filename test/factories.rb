FactoryGirl.define do

  factory :listing_area do
    name "SLV Central"
    policy "Salt Lake Valley Central policy goes here"
    kml { File.new("#{Rails.root}/test/fixtures/SLV_Central.kml") }
  end
  
end