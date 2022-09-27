![](https://img.shields.io/badge/Microverse-blueviolet)

# Rails Blog App

> In this app I'm bulding a blog where people can sign up, make posts and comments, and like posts.

## Built With

- Ruby
- Rails
- Rspec
- Capybara

## Getting Started
#### Setup

Follow these steps on your console to properly clone this repository on your desktop:

```
$ cd desktop
$ git clone 'repo_path'
$ cd 'repo_name'
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
  username: postgres
  password:
  
  test:
  <<: *default
  database: rails
  username: postgres
  password:
```

Add the following gems into your `Gemfile` development and test groups:

```
group :development, :test do
  gem 'capybara'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'ffi'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'webdrivers'
end
```

```
group :development do
  gem "web-console"
  gem 'bullet'
end
```

Install all gems `bundle install`

Set up bullet gem by running: `bundle exec rails g bullet:install`

Set up RSpec in your app and create the Spec folder `rails g rspec:install`

Run the migration into your testing environment `rails db:migrate RAILS_ENV=test`

To see all tests with description run `rspec spec --format documentation`

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
