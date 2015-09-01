#!/usr/bin/env ruby

require './db/schema'
require './lib/film'
require 'colorize'

def main
  quit_options = ['quit', 'Quit', 'Q', 'q']
  prompt = "> ".colorize(:light_blue)
  print "What do you want to do with your Movie List?\nType help for instructions\n".colorize(:green), prompt
  choice = gets.chomp

  unless quit_options.include?(choice)
    case choice
      when 'add'
        print "Give a movie name to add:\n", prompt
        title = gets.chomp
        print "Rate this movie objectively from 1 to 10:\n", prompt
        rating = gets.chomp
        puts Film.add(title, rating)
        main
      when 'delete'
        print "Give a movie name to delete:\n", prompt 
        title = gets.chomp
        puts Film.delete(title)
        main
      when 'update'
        print "Give a movie name to update:\n", prompt
        title = gets.chomp
        print "Give the new value of your rating:\n", prompt
        rating = gets.chomp
        puts Film.update(title, rating)
        main
      when 'display'
        movie_header = "Movies"
        movie_rating_header = "Rating"
        printf "%-70s %s\n\n".colorize(:color => :bold, :background => :blue), movie_header, movie_rating_header
        Film.display
        main
      when 'help'
        Film.help
        main
      else
        print "Unrecognized choice. Type 'help' for options.\n".colorize(:red), prompt
        main
    end
  else
    puts "Thank you for using the Movie List!".colorize(:green)
    exit 0
  end
end

if __FILE__ == $0
  main
end
