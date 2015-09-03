#!/usr/bin/env ruby

require 'colorize'

## Module Films for operations of the movie list.
module Film
  def self.add(title, rating)
    movie = Movie.create(title: title, rating: rating)
    if movie.errors.any?
      puts "Movie can't be blank or already exists.".colorize(:red)
    else
      "#{title} added to your movie list with your rating #{rating}"
    end
  end

  def self.display
    Movie.all.order(:title).each do |movie|
      printf "%-70s : %s\n".colorize(:light_blue), movie.title, movie.rating
    end
  end

  def self.delete(title)
    movie = Movie.find_by(title: title)
    if movie.nil? || movie.errors.any?
      puts "#{title} does not exist in the movie list".colorize(:red)
    else
      movie.delete
      puts "#{title} deleted from your movies".colorize(:green)
    end
  end

  def self.update(title, rating)
    movie = Movie.find_by(title: title)
    if movie.nil? || movie.errors.any?
      puts "#{title} does not exist in the movie list".colorize(:red)
    else
      movie.update_attributes(rating: rating)
      puts "#{title} updated with your new rating #{rating}".colorize(:green)
    end
  end

  def self.help
    puts "\nadd: Add a movie to your movie list with a rating between 1-10
update: Type down an existing movie title and update its rating in your movie list.
delete: Type down an existing movie title and delete that entry from your movie list.
display: See your Movie List with the ratings.
quit: Exit Movie List (Quit,quit,q,Q options should work!)
help: See this guide.\n".colorize(:color => :green)
  end
end
