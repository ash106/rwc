FactoryGirl.define do

  factory :user do
    email "tester@example.com"
    password "password"
    password_confirmation "password"

    factory :admin do
        after(:create) { |user| user.add_role(:admin) }
    end
  end

  factory :listing_area do
    name "SLV Central"
    policy "Salt Lake Valley Central policy goes here"
    kml { File.open(File.join(Rails.root, "/test/fixtures/SLV_Central.kml")) }
  end

  factory :wanted do
    listing_area
    volume 20
    source 'Surface'
    description 'Need 5 to 20 acre feet of Strawberry Water.'
    contact_info 'tester@example.com'
  end

  factory :for_sale do
    listing_area
    volume 100
    source 'Well'
    description 'This can be moved throughout most of this area'
    price 4000
    contact_info 'tester@example.com'
  end

  factory :place_of_use_area do
    name 'Area One'
    kml { File.open(File.join(Rails.root, "/test/fixtures/Area_1.kml")) }
  end
  
  factory :point_of_diversion do
    name 'Stream'
    kml { File.open(File.join(Rails.root, "/test/fixtures/Stream.kml")) }
  end

end