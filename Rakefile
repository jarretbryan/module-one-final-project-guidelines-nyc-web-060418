require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  #binding.pry
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end
