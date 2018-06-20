require 'bundler'
Bundler.require
#binding.pry

 # standard = ActiveRecord::Base.logger
 # ActiveRecord::Base.logger = nil

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.db')

require_all 'lib'
require_all 'app'
