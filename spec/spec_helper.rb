require 'pry'
require 'simplecov'
require 'yamlet'

SimpleCov.start
Yamlet.repository_file = 'spec/support/data/data.yml'

Dir['./spec/support/**/*.rb'].each { |f| require f }
Dir['lib/**/*.rb'].each { |file| require File.expand_path(file) }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.example_status_persistence_file_path = 'spec/examples.txt'
end
