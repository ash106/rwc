if Rails.env.development?
  # require 'factory_girl'

  namespace :dev do
    desc 'Seed data for development environment'
    task prime: 'db:setup' do
      # FactoryGirl.find_definitions
      # include FactoryGirl::Syntax::Methods

      # create(:user, email: 'user@example.com', password: 'password')
      # User.create!(email: 'user@example.com', password: 'changeme')
    end
  end
end
