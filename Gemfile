source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

#Rspec against the master branch
# %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
#   gem lib, :git => "https://github.com/rspec/#{lib}.git", :branch => 'master'
# end
#popperJS
gem 'popper_js', '~> 1.12.9'
#responders
gem 'responders', '~> 2.0'
#ruby VERSION
ruby '2.3.1'
#Devise
gem 'devise', git: 'https://github.com/plataformatec/devise'
#Bootstrap v4
gem 'bootstrap', '~> 4.1.1'
#jQuery for bootstrap
gem 'jquery-rails'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'

# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  #Rspec for Rails5+
   gem 'rspec-rails', '~> 3.7'
   #Annotate to display the model schema
   gem 'annotate', git: 'https://github.com/ctran/annotate_models.git'
   #shoulda-matchers
   gem 'shoulda-matchers','~> 3.1'
   #rails-controller-testing
   gem 'rails-controller-testing'
   #Factory_girls_FACTORY_BOT
   gem 'factory_bot_rails'
   #Faker Internet
   gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
   #RSpecHtmlMatchers
   gem 'rspec-html-matchers'
   # Adds support for Capybara system testing and selenium driver
   gem 'capybara', '3.3.1'
   gem 'selenium-webdriver'
   # Easy installation and use of chromedriver to run system tests with Chrome
   gem 'chromedriver-helper'
   #simplecov to validate test coverage
   gem 'simplecov', require: false, group: :test
   #Capybara screenshot
   gem 'capybara-screenshot', :group => :test
   #Capybara Forms
   gem 'formulaic', '0.4.0' ,group: :test
   #gem
   gem 'capybara-webkit'

end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end



# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
