source "https://rubygems.org"


gem "rails", "~> 4.1.1"
# Use sqlite3 as the database for Active Record
gem "sqlite3"
# Use SCSS for stylesheets
gem "sass-rails", "~> 4.0.3"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use CoffeeScript for .js.coffee assets and views
gem "coffee-rails", "~> 4.0.0"
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem "therubyracer",  platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails"

# bundle exec rake doc:rails generates the API under doc/api.
gem "sdoc", "~> 0.4.0",          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem "spring",        group: :development

# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"

gem "puma"
gem "paperclip", "~> 4.1"
gem "purecss", "~> 0.5.0"
gem "devise", "~> 3.2"

group :development, :test do
  gem "rspec-rails", "~> 3.0"
  gem "guard-rspec"
  gem "spring-commands-rspec"
  gem "pry-rails"
end

group :test do
  gem "shoulda-matchers", require: false
  gem "simplecov", require: false
  gem "capybara"
  gem "poltergeist", require: false
  gem "database_cleaner"
end
