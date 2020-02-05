source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'devise'         # Devise is a flexible authentication solution for Rails based on Warden
gem 'haml-rails'     # Use haml instead of erb
gem 'honeybadger'    # honeybadger error reporting tool
gem 'pry-rails'      # Pretty print in rails console and set debug breakpoints in server console
gem 'sidekiq'        # Background jobs
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'bullet'       # Set env BULLET = true to activate. Bullet help to kill N+1 queries and unused eager loading
  gem 'capybara'     # Write tests that simulate how your users will use your application
  gem 'dotenv-rails' # Handle env vars
  gem 'fabrication'  # Test subject builder for the specs
  gem 'faker'        # Create dummy data for the test objects
  gem 'foreman'      # To run app and webpack together
  gem 'guard-rspec', require: false # automatically run tests on changes
  gem 'overcommit'   # Run Rubucop rules when committing
  gem 'parallel_tests' # rails parallel:spec to run specs in parallel
  gem 'rspec-rails'  # Testing framework
  gem 'rubocop'      # code style rules
end

group :development do
  gem 'lol_dba' # 'rake db:find_indexes' to get hints about missing indexes. https://github.com/plentz/lol_dba
end
