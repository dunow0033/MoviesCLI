class MovieTimes::CLI
    def first
        greet_user
    end
    
    def greet_user
        puts "Welcome to the movie info app!!"
        movie = nil
        #Movies.movie_loop
        until movie == "exit"
            movie = prompt_for_movie_info
            MovieTimes::API.movieInfo(movie)
            display_movie_data
        end
    end

    def prompt_for_movie_info
        gets.chomp
    end

    def display_movie_data
        MovieTimes::Movies.all.each do | movie |
            puts "Movie: " + movie.title
            puts "Director: " + movie.director.to_s
            puts "Date Released: " + movie.date_released.to_s
            puts "Rating: " + movie.rating.to_s
        end
    end
end