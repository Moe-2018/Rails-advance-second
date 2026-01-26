source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.2.2"
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use dotenv to load environment variables from .env [https://github.com/bkeepers/dotenv]
gem "dotenv-rails"

# Use the Prism syntax highlighter for code blocks in Markdown
gem "prism", "1.3.0"

# Use Tailwind CSS for styling [https://tailwindcss.com/docs/installation#ruby-on-rails]
gem "tailwindcss-rails", "~> 3.3.1"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri windows]

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # A Ruby static code analyzer and formatter, based on the community Ruby style guide.
  gem "rubocop"

  # An extension of RuboCop focused on code performance checks.
  gem "rubocop-performance"

  # A RuboCop extension focused on enforcing Rails best practices and coding conventions.
  gem "rubocop-rails"

  # A RuboCop extension focused on enforcing RSpec best practices and coding conventions.
  gem "rubocop-rspec"

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false

  # RSpec for testing [https://rspec.info]
  gem "rspec-rails"

  # Factory Bot for testing [https://github.com/thoughtbot/factory_bot_rails]
  gem "factory_bot_rails"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # HTML builder
  gem "htmlbeautifier"

  # Language server protocol support
  gem "ruby-lsp"

  # Email preview tool
  gem "letter_opener_web", "~> 3.0"

  # Better error pages
  gem "better_errors"

  # Debugging tool
  gem "binding_of_caller"

  # Faker for testing [https://github.com/faker-ruby/faker]
  gem "faker", require: false

  # N+1 query detection
  gem 'bullet'
end

group :test do
  # Browser automation
  gem "launchy"

  # RSpec matchers
  gem "shoulda-matchers"
end
