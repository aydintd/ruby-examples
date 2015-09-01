#!/usr/bin/env ruby

module Film
  def Film.add(title, rating)
    movie = Movie.create(title: title, rating: rating)
    if movie.errors.any?
      movie.errors.messages
    else
      "#{title} added to your movie list with your rating #{rating}"
    end
  end

  def Film.display
    Movie.all.order(:title).each do |movie|
      printf "%-70s : %s\n", movie.title, movie.rating
    end
  end

  def Film.delete(title)
    unless movie = Movie.find_by(title: title)
      puts "Movie does not exist"
    else
      movie = Movie.find_by(title: title)
      movie.destroy
      if movie.errors.any?
        movie.errors.messages
      else
        puts "#{title} deleted from your movies"
      end
    end
  end

  def Film.update(title, rating)
    unless movie = Movie.find_by(title: title)
      puts "Movie does not exist"
    else
      movie = Movie.find_by(title: title)
      movie.update_attributes(rating: rating)
      if movie.errors.any?
        movie.errors.messages
      else
        puts "#{title} updated with your new rating #{rating}"
      end
    end
  end

  def Film.help
    puts "add: Add a movie to your movie list with a rating between 1-10 
update: Type down an existing movie title and update its rating in your movie list.
delete: Type down an existing movie title and delete that entry from your movie list.
display: See your Movie List with the ratings.
quit: Exit Movie List (Quit,quit,q,Q options should work!)
help: See this guide."
  end
end
