class MovieTimes::CLI
    def first
        #calls the function which will start the initial app loop logic
        greet_user
    end
    
    def greet_user
        puts
        #print welcome message
        print "Welcome to the movie trivia app!!"
        puts
        puts
        puts
        #asking for ititial movie title
        print "Please enter a movie title:  "

        #called the function that asks for user input, assigns it to the movie variable
        movie = prompt_for_answer

        #while the user wants to keep getting movie trivia, keep retieving it while in a while loop
        #checking for a value of 'q'
        while movie != "q"
            #checking for a valid movie title in a while loop
            while MovieTimes::API.checkForInvalidMovie(movie) == nil
                puts

                #print an error message if the movie title was invalid, and then use the user 
                #input method to try for another movie title
                print "Invalid movie title, please try again (or 'q' to quit):  "
                movie = prompt_for_answer
            end

            #if the movie title entered was valid, call the API class method for retrieving the movie trivia
            MovieTimes::API.movieInfo(movie)

            #use the movie trivia collected to display the movie data, which is handled by a specific function
            #this is the initial data asked for
            display_movie_data

            #ask the user if they would like to see some additional trivia for the movie that they entered
            print "Would you like to see additonal info for that movie or see trivia for another movie? ('y' or 'n'):  "
            additional_movie_answer
            movie = next_movie
        end
        puts
        puts "Thank you!!  Have a good day!!"
        puts
        exit
    end

    def prompt_for_answer
        gets.chomp
    end

    def next_movie
        puts
        print "Please enter another movie title (or 'q' to quit):  "
        prompt_for_answer
    end

    def display_movie_data
        puts
        puts "Movie: " + MovieTimes::Movies.last.title.to_s
        puts "Director: " + MovieTimes::Movies.last.director.to_s
        puts "Date Released: " + MovieTimes::Movies.last.date_released.to_s
        puts "Rating: " + MovieTimes::Movies.last.rating.to_s
        puts
        puts
    end

    def additional_movie_answer
        answer = prompt_for_answer
        if answer == 'y'
            additional_movie_data
        elsif answer == 'n'
            puts
            puts
            greet_user
        else
            puts "Sorry, I didn't understand that response!!  Let's go back to the beginning!!"
            puts
            greet_user
        end
    end

    def additional_movie_data
        puts
        puts "Writer: " + MovieTimes::Movies.last.writer.to_s
        puts "Actors: " + MovieTimes::Movies.last.actors.to_s
        puts "Plot: " + MovieTimes::Movies.last.plot.to_s
        puts "Awards: " + MovieTimes::Movies.last.awards.to_s
        puts
        puts
    end
end