source 'https://rubygems.org'

gem 'rails', '4.2.1'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'unicorn'
gem 'bootstrap-sass'
gem 'figaro'
gem 'yelp', require: 'yelp'
gem 'responders'
gem 'newrelic_rpm'
gem "skylight"
gem 'webmock', group: :test
gem 'rack-cors', require: 'rack/cors'
gem 'keen'
gem 'rails-api'

group :development, :test do
  gem "teaspoon-mocha"
  gem 'capybara'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rspec-rails', '~> 3.0'
  gem 'pry'
  gem 'vcr'
  gem 'simplecov'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'konacha'
  # gem 'emoji-rspec', git: "git@github.com:carhartl/emoji-rspec.git", branch: "rspec-3"
end

group :test do
    gem 'poltergeist'
    gem 'phantomjs', :require => 'phantomjs/poltergeist'
end

group :production do
  gem 'rails_12factor'
end
