#!/usr/bin/env ruby

require '/home/aydintd/workspace/ruby/movie-list/db/schema'

def main
  puts "What do you want to with your Movie list? (add/display/delete/update)"
  choice = gets.chomp
  
  case choice
    when "add"
      add
    when "delete"
      delete
    when "update"
      update
    when "display"
      display
    else
      puts "Unrecognized choice."
      help
  end
end

def add
  puts "Give a movie name to add:"
  title = gets.chomp.to_sym
  puts "Rate this movie objectively from 1 to 10:"
  rating = gets.chomp.to_i
  movie = Movie.find_by(title: title)
  if (1..10).include?(rating)
    if movie
      puts "Movie already exists"
    else
      movie = Movie.new
      movie.title = title
      movie.rating = rating
      movie.save
      puts "#{title} added to your movie list with your rating #{rating}"
    end
  else
    puts "Please rate your movie between 1-10"
  end
end

def display
  Movie.all.order(:title).each do |movie|
      puts "#{movie.title} : #{movie.rating}"
  end
end

def delete
  puts "Give a movie name to delete:"
  title = gets.chomp.to_sym
  unless movie = Movie.find_by(title: title)
    puts "Movie does not exist"
  else
    movie = Movie.find_by(title: title)
    movie.delete
    puts "#{title} deleted from your movies"
  end
end

def update
  puts "Give a movie name to update:"
  title = gets.chomp.to_sym
  unless movie = Movie.find_by(title: title)
    puts "Movie does not exist"
  else
    puts "Give the new value of your rating:"
    rating = gets.chomp.to_i
    if (1..10).include?(rating)
      movie = Movie.find_by(title: title)
      movie.rating = rating
      movie.save
      puts "#{title} updated with your new rating #{rating}"
    else
      puts "Give a rate to the #{title} between 1-10"
    end
  end
end

def help
  puts "To manipulate your movie list please use add/delete/update/display"
end

if __FILE__ == main
  main
end
