require 'rubygems'
require 'logger'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(File.open('log/database.log', 'w'))

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :host => "localhost",
  :database => "movielistdb",
  :username => "movielist",
  :password => "s3cr3t"
)
