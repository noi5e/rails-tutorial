source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.3"

gem "rails", "8.0.2"
gem "propshaft", "1.2.1"
gem "importmap-rails", "2.1.0"
gem "turbo-rails", "2.0.14"
gem "stimulus-rails", "1.3.4"
gem "jbuilder", "2.13.0"
gem "puma", "6.6.0"
gem "bootsnap", "1.18.6", require: false
gem "tzinfo-data", "1.2025.2", platforms: %i[ windows jruby ]
gem "kamal", "2.7.0", require: false
gem "thruster", "0.1.15", require: false

group :development, :test do
  gem "sqlite3", "2.7.2"
  gem "debug", "1.11.0", platforms: %i[ mri windows ], require: "debug/prelude"
end

group :development do
  gem "web-console", "4.2.1"
end

group :test do
  gem "capybara", "3.40.0"
  gem "selenium-webdriver", "4.9.0"
  gem "webdrivers", "5.3.1"
end

group :production do
  gem "pg", "1.5.9"
end