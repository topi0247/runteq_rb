source "https://rubygems.org"

gem "rails", "~> 7.2.2"
gem "propshaft"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

gem "dotenv-rails", "~> 2.6"
gem "omniauth"
gem "omniauth-rails_csrf_protection"
gem "omniauth-github", "~> 2.0.0"
gem "rails-i18n"
gem "enum_help"
gem "ransack"