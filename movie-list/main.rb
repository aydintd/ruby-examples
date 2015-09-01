#!/usr/bin/env ruby

require './db/schema'
require './lib/film'

def main
  quit_options = ['quit', 'Quit', 'Q', 'q']
  puts "What do you want to do with your Movie List?\nType help for instructions"
  choice = gets.chomp

  unless quit_options.include?(choice)
    case choice
      when 'add'
        puts "Give a movie name to add:"
        title = gets.chomp
        puts "Rate this movie objectively from 1 to 10:"
        rating = gets.chomp
        puts Film.add(title, rating)
        main
      when 'delete'
        puts "Give a movie name to delete:"
        title = gets.chomp
        puts Film.delete(title)
        main
      when 'update'
        puts "Give a movie name to update:"
        title = gets.chomp
        puts "Give the new value of your rating:"
        rating = gets.chomp
        puts Film.update(title, rating)
        main
      when 'display'
        movie_header = "Movies"
        movie_rating_header = "Rating"
        printf "%-70s %s\n\n", movie_header, movie_rating_header
        Film.display
        main
      when 'help'
        Film.help
        main
      else
        puts "Unrecognized choice. Type 'help' for options."
        main
    end
  else
    puts "Thank you for using the Movie List!"
    exit 0
  end
end

if __FILE__ == $0
  main
end
