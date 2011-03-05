ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), *%w[.. app])

require 'capybara'
require 'capybara/dsl'
require 'rspec'
# require 'spec/autorun'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false
