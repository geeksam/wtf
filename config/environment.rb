require 'active_record'

dbconfig = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig[ENV['RACK_ENV'] || 'development']

AppRoot = File.expand_path(File.join(File.dirname(__FILE__), *%w[..]))
$: << File.join(AppRoot, 'models')

require 'project'
