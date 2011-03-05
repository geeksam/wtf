# Gem voodoo
require 'rubygems'
require 'bundler'
Bundler.setup

# Set up ActiveRecord
require 'active_record'
dbconfig = YAML.load(File.read(File.join(AppRoot, *%w[config database.yml])))
ActiveRecord::Base.establish_connection dbconfig[ENV['RACK_ENV'] || 'development']

# Require models
$: << File.join(AppRoot, 'models')
require 'project'
