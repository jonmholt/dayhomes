source 'http://rubygems.org'

gem 'rails', '3.2.2'
gem 'mysql2'
gem 'haml'
#gem 'gmaps4rails', :git => 'git@github.com:RyanonRails/Google-Maps-for-Rails.git'
gem 'gmaps4rails','1.4.8'
gem 'jquery-rails'
gem 'carmen'
gem 'authlogic'
gem 'kaminari'
gem 'awesome_print'
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'
gem 'jquery-star-rating-rails'
gem 'client_side_validations'
gem 'forum_monster'
gem 'bb-ruby'
gem 'koala'
gem 'airbrake'

# le windows
platforms :mswin, :mingw do
  gem 'eventmachine', '1.0.0.beta.4.1'
  #gem 'eventmachine', :git=> 'git://github.com/eventmachine/eventmachine.git'
  gem 'thin'
end

group :assets do
  gem 'sass-rails', '~> 3.1'
  gem 'bootstrap-sass', '~> 2.0.2'

  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'awesome_print'
  gem 'capistrano-fanfare'
  gem 'rspec-rails', '~> 2.6'
  gem 'webrat', '~> 0.7.3'
  gem 'factory_girl_rails', :require => false
  gem 'shoulda-matchers'
  gem 'spork', '~> 1.0rc'
  gem 'capybara'
  gem 'guard-rspec'
end

group :production do
  # app server and process management
  gem 'unicorn'
  gem 'foreman'
end