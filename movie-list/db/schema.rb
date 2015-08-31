require '/home/aydintd/workspace/ruby/movie-list/db/db_configuration'

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'movies'
    create_table :movies do |table|
      table.column :title, :string
      table.column :rating, :integer
    end
  end
end

class Movie < ActiveRecord::Base
end
