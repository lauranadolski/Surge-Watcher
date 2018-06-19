require 'bundler/setup'
Bundler.require

require 'rake'
require 'active_record'
require 'yaml/store'
require 'ostruct'
require 'date'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/development.sqlite'
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

# Creates AR db and pulls in our Ruby code.
require_all 'app'
