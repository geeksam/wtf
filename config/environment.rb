require 'sinatra'
require 'active_record'

dbconfig = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig[ENV['RACK_ENV']]

AppRoot = File.expand_path(File.join(File.dirname(__FILE__), *%w[..]))
$: << File.join(AppRoot, *%w[db models])

require 'project'
