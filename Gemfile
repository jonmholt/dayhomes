source 'https://rubygems.org'

gem 'rails', '3.2.2'
gem 'jquery-rails'
gem 'haml'
gem 'gmaps4rails'
gem 'rspec-rails'

group :assets do
  gem 'sass-rails', '~> 3.1'
  gem 'bootstrap-sass', '~> 2.0.1'

  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'sqlite3'
  gem 'capistrano-fanfare'
end

group :production do
  # app server and process management
  gem 'unicorn'
  gem 'foreman'
  gem 'mysql2'
end
