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

ActiveRecord::Base.logger = nil

# Logger.new(STDOUT)

# Creates AR db and pulls in our Ruby code.
# require_all '../app'
require_relative '../app/models/destination.rb'
require_relative '../app/models/origin.rb'
require_relative '../app/models/trip_estimate.rb'
require_relative '../app/models/user.rb'
