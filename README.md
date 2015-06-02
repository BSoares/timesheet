[![Code Climate](https://codeclimate.com/github/BSoares/timesheet/badges/gpa.svg)](https://codeclimate.com/github/BSoares/timesheet) [![Test Coverage](https://codeclimate.com/github/BSoares/timesheet/badges/coverage.svg)](https://codeclimate.com/github/BSoares/timesheet/coverage)

# Timesheet

Playing around with rails 4


### Dependencies

* Ruby 2.2.2
* Rails 4.2.1
* PostgreSQL
* PhantomJS 1.9.8 (used in tests)

```
# Setup PhantomJS 1.9.8 in mac with homebrew
brew install homebrew/versions/phantomjs198
```

### Running the Application

1. Run ```bundle install```
2. Prepare the database with ```rake db:setup```
3. Insert some data ```rake db:seed```
4. And finaly run the server with ```rails s```

### Running Tests

* Just run ```rspec```

### Running Guard with Robocop

* Just run ```bundle exec guard```
