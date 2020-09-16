require 'pry'

class MovieTimes::CLI
    def first
        greet_user
    end
    
    def greet_user
        puts "Welcome to the movie info app!!"
        puts
        print "Please enter a movie title:  "
        movie = prompt_for_movie_info
        while movie != "q"
            while MovieTimes::API.checkForInvalidMovie(movie) == nil
                puts
                print "Invalid movie title, please try again (or 'q' to quit):  "
                movie = prompt_for_movie_info
            end
            MovieTimes::API.movieInfo(movie)
            display_movie_data
            movie = next_movie
        end
    end

    def prompt_for_movie_info
        gets.chomp
    end

    def next_movie
        puts
        print "Please enter another movie title (or 'q' to quit):  "
        prompt_for_movie_info
    end

    def display_movie_data
        puts
        puts "Movie: " + MovieTimes::Movies.last.title.to_s
        puts "Director: " + MovieTimes::Movies.last.director.to_s
        puts "Date Released: " + MovieTimes::Movies.last.date_released.to_s
        puts "Rating: " + MovieTimes::Movies.last.rating.to_s
    end
end