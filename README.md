[![Code Climate](https://codeclimate.com/github/BSoares/timesheet/badges/gpa.svg)](https://codeclimate.com/github/BSoares/timesheet) [![Test Coverage](https://codeclimate.com/github/BSoares/timesheet/badges/coverage.svg)](https://codeclimate.com/github/BSoares/timesheet/coverage)

# Timesheet

Playing around with rails 4


### Dependencies

* PhantomJS 1.9.8

```
# Setup in mac with homebrew
brew install homebrew/versions/phantomjs198
```

### Running the Application

1. Dublicate and configura sensitive files

```
cp config/database.yml config/database.example.yml && \
cp config/secrets.yml config/secrets.example.yml

```

2. Run ```bundle install```
3. Prepare the database with ```rake db:setup```
4. Insert some data ```rake db:seed```
5. And finaly run the server with ```rails s```

### Running Tests

* Just run ```rspec```

### Running Guard with Robocop

* Just run ```bundle exec guard```
