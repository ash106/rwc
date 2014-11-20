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
  
end