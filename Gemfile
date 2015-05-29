source "https://rubygems.org"

ruby "2.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "4.2.1"

# Use postgresql as the database for Active Record
gem "pg"

# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"

# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"

# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.1.0"

# Use jquery as the JavaScript library
gem "jquery-rails"

# Turbolinks makes following links in your web application faster.
# https://github.com/rails/turbolinks
gem "turbolinks"

# OpenBSD bcrypt() password hashing algorithm
# https://github.com/codahale/bcrypt-ruby
gem "bcrypt"

group :development, :test do
  # Use Unicorn with rails server command
  # https://github.com/samuelkadolph/unicorn-rails
  gem "unicorn-rails"
  gem "unicorn"

  # https://github.com/rweng/pry-rails
  gem "pry-rails"

  # Adds step, next, finish and continue commands and breakpoints to
  # Pry using byebug.
  # https://github.com/deivid-rodriguez/pry-byebug
  gem "pry-byebug"

  # Ruby library that pretty prints Ruby objects in full color.
  # https://github.com/michaeldv/awesome_print
  gem "awesome_print", require: "ap"

  # Access an IRB console on exception pages or by using <%= console %> in views
  # https://github.com/rails/web-console
  gem "web-console", "~> 2.0"

  # Spring speeds up development by keeping your application running in
  # the background.
  # https://github.com/rails/spring
  gem "spring"
end

group :development do
  # RuboCop is a Ruby static code analyzer.
  # https://github.com/bbatsov/rubocop
  gem "rubocop", require: false

  # guard-rubocop allows you to automatically check Ruby code style with
  # RuboCop when files are modified.
  # https://github.com/yujinakayama/guard-rubocop
  gem "guard-rubocop"

  # Turns off the Rails asset pipeline log.
  # https://github.com/evrone/quiet_assets
  gem "quiet_assets"

  # Detect N+1 queries and others performance improvements.
  # https://github.com/flyerhzm/bullet
  gem "bullet"
end
