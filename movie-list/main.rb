#!/usr/bin/env ruby

require './db/schema'
require './lib/film'

def main
  puts "What do you want to with your Movie list? (add/display/delete/update)"
  choice = gets.chomp

  case choice
  when "add"
    puts "Give a movie name to add:"
    title = gets.chomp
    puts "Rate this movie objectively from 1 to 10:"
    rating = gets.chomp
    puts Film.add(title, rating)
  when "delete"
    puts "Give a movie name to delete:"
    title = gets.chomp
    puts Film.delete(title)
  when "update"
    puts "Give a movie name to update:"
    title = gets.chomp
    puts "Give the new value of your rating:"
    rating = gets.chomp
    puts Film.update(title)
  when "display"
    movie_header = "Movies"
    movie_rating_header = "Rating"
    printf "%-70s %s\n\n", movie_header, movie_rating_header
    Film.display
  else
    puts "Unrecognized choice."
    Film.help
  end
end

if __FILE__ == $0
  main
end
