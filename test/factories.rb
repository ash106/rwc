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
    # listing_area
    volume 20
    source 'Surface'
    description 'Need 5 to 20 acre feet of Strawberry Water.'
    contact_info 'tester@example.com'
    after(:build) do |wanted|
      wanted.listing_area = (ListingArea.first || create(:listing_area))
    end
  end

  factory :for_sale do
    # listing_area
    volume 100
    source 'Well'
    description 'This can be moved throughout most of this area'
    price 4000
    contact_info 'tester@example.com'
    after(:build) do |wanted|
      wanted.listing_area = (ListingArea.first || create(:listing_area))
    end
  end

  factory :place_of_use_area do
    sequence(:name) { |n| "Area #{n}" }
    kml { File.open(File.join(Rails.root, "/test/fixtures/Area_1.kml")) }
  end
  
  factory :point_of_diversion do
    sequence(:name) { |n| "Stream #{n}" }
    kml { File.open(File.join(Rails.root, "/test/fixtures/Stream.kml")) }
  end

  factory :water_right do
    number '13-1138'
    flow_cfs 10
    flow_ac_ft 1920
    sole_supply_acres 640
    uses 'Most Farm'
    change_application_number 'a28259'
    proof_due_date "2015-05-31"
    priority_date "1972-07-17"
    external_link "https://www.google.com/"
    # user
    after(:build) do |wr|
      wr.place_of_use_areas << create(:place_of_use_area)
      wr.point_of_diversions << create(:point_of_diversion)
    end
  end

end