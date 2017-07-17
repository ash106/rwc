source 'https://rubygems.org'

ruby '2.4.1'

gem 'coffee-rails'
gem 'delayed_job_active_record'
gem 'flutie'
gem 'high_voltage'
gem 'jquery-rails'
gem 'pg'
gem 'rack-timeout'
gem 'rails', '4.2.9'
gem 'sass-rails', '~> 5.0.6'
gem 'simple_form', '~> 3.5.0'
gem 'uglifier'
gem 'devise', '~> 3.5.0'
gem 'rolify', '~> 3.4'
gem 'paperclip', '~> 4.2.0'
gem 'aws-sdk', '< 2'
gem 'nokogiri', '~> 1.8.0'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'active_model_serializers', '~> 0.10.6'
gem 'underscore-rails'
gem 'pundit'
gem 'eco'
gem 'coveralls', require: false
gem 'polylines'
gem 'simplify_rb'
gem 'jquery-minicolors-rails'
gem 'font-awesome-rails'
gem 'puma'


group :development do
  gem 'foreman'
  gem 'spring'
  gem 'meta_request', '~> 0.3.0'
  gem 'web-console', '~> 2.0'
end

group :development, :test do
  gem 'awesome_print'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
  gem 'timecop'
  gem 'webmock'
  gem "codeclimate-test-reporter", "~> 0.6.0", require: nil
  gem 'simplecov', :require => false
end

group :staging, :production do
  gem 'rails_12factor'
  gem 'newrelic_rpm', '>= 3.7.3'
end
