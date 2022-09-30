![](https://img.shields.io/badge/Microverse-blueviolet)

# Rails Blog App

> In this app I'm bulding a blog where people can sign up, make posts and comments, and like posts.

## Built With

- Ruby
- Rails
- Rspec
- Capybara

## Getting Started
### Setup

Follow these steps on your console to properly clone this repository on your desktop:

```
$ cd desktop
$ git clone https://github.com/Daf98/Rails-Blog.git
$ cd Rails_Blog
$ code .
Run 'ruby file_name' to see outputs in the console.
Run 'rubocop' to check linter offenses.
```

Create database for the project with `bin/rails db:create`, otherwise create databases manually in PostgreSQL.

If necessary, add username and password in `config/database.yml` for development and test:
```
development:
  <<: *default
  database: rails
  username:
  password:
  
  test:
  <<: *default
  database: rails_test
  username:
  password:
```

Add the following gems into your `Gemfile` development and test groups:

```
gem 'rswag-api'
gem 'rswag-ui'

# For user authentication
gem 'devise'

# For user authorization
gem 'cancancan'

# For Token based authentication
gem 'jwt'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'ffi'
  gem "database_cleaner"
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'rswag-specs'
end
```

```
group :development do
  gem 'bullet'
  gem "web-console"
end
```

```
group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
```

Install all gems `bundle install`

Set up bullet gem by running: `bundle exec rails g bullet:install`

Set up RSpec in your app and create the Spec folder `rails g rspec:install`

Run the migration into your testing environment `rails db:migrate RAILS_ENV=test`

To see all tests with description run `rspec spec --format documentation`

#### Capybara

- Make sure to add `require "capybara/rspec"` in your `spec/rails_helper` file:

```
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "spec_helper"
require "rspec/rails"
# Add additional requires below this line. Rails is not loaded until this point!
require "capybara/rspec"
...
end
```

### API Documentation
- To access to the API documentation run `rails s` in yuor terminal an head to `http://localhost:3000/api-docs/index.html`

## Authors

👤 **Dafne Azzolina**

- GitHub: [@Daf98](https://github.com/Daf98)
- Twitter: [@dafne_azzolina](https://twitter.com/dafne_azzolina)
- LinkedIn: [dafne-azzolina](https://www.linkedin.com/in/dafne-azzolina/)

👤 **Mike Martínez**

- GitHub: [@mikemtzp](https://github.com/mikemtzp)
- Twitter: [@mikemtzp](https://twitter.com/mikemtzp)
- LinkedIn: [Mike Martínez](https://www.linkedin.com/in/mike-mart%C3%ADnez/)

## Show your support

Give a ⭐️ if you like this project!
## 📝 License

This project is [MIT](./MIT.md) licensed.
