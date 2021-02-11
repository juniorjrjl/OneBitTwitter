source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.8'

gem 'rails', '~> 6.1.2'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rack-attack'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'redis'#, '~> 3.0'
gem 'will_paginate'#, '~> 3.1.0'
gem 'cancancan'
gem 'acts_as_follower', github: 'tcocca/acts_as_follower', branch: 'master'
gem 'acts_as_votable'#, '~> 0.11.1'
gem 'searchkick'
gem 'whenever', :require => false
gem 'bcrypt'#, '~> 3.1.7'
gem 'knock'#, '~> 2.1', '>= 2.1.1'
gem 'active_model_serializers'

group :test do
  gem 'factory_bot_rails'#, "~> 4.0"
  gem "ffaker"
  gem 'database_cleaner'
end

group :development, :test do
  gem 'rspec-rails'#, '~> 3.5'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-json_expectations'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
