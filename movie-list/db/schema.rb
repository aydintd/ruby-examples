require './db/db_configuration'

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'movies'
    create_table :movies do |table|
      table.column :title, :string
      table.column :rating, :integer
    end
  end
end

class Movie < ActiveRecord::Base
  validates :title, uniqueness: { message: "Movie already exists." }
  validates :rating, inclusion: {in: (1..10).to_a,  message: "Please rate your movie between 1-10" }
end
