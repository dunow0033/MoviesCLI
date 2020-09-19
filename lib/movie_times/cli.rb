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

            #function to get the answer about whether or not they want to see additional movie trivia
            additional_movie_answer

            #function to move on to next movie after additional movie trivia displayed
            movie = next_movie
        end
        puts

        #exit message
        puts "Thank you!!  Have a good day!!"
        puts

        #exit the program
        exit
    end

    #function to get the user input
    def prompt_for_answer
        gets.chomp
    end

    #function to print message asking for next movie title, then getting user input
    def next_movie
        puts
        print "Please enter another movie title (or 'q' to quit):  "
        prompt_for_answer
    end

    #function to display initial set of movie trivia...it does this by calling movie class
    #and the function in that class to retieve the last movie entered, and by called on
    #attributes of that movie
    def display_movie_data
        puts
        puts "Movie: " + MovieTimes::Movies.last.title
        puts "Director: " + MovieTimes::Movies.last.director
        puts "Date Released: " + MovieTimes::Movies.last.date_released
        puts "Rating: " + MovieTimes::Movies.last.rating
        puts
        puts
    end

    #function that uses an if statement to get user's input on whether or not to display additional movie trivia
    def additional_movie_answer
        answer = prompt_for_answer
        if answer == 'y'
            #if the user wants to see additional data, call that particular function
            additional_movie_data
        elsif answer == 'n'
            puts
            puts
            #if the user does not want to see additional data, call the original loop asking for input
            greet_user
        else
            puts "Sorry, I didn't understand that response!!  Let's go back to the beginning!!"
            puts
            #if the user enters an invalid response, take them back to the original loop
            greet_user
        end
    end

    #function to display additional movie trivia
    def additional_movie_data
        puts
        puts "Writer: " + MovieTimes::Movies.last.writer
        puts "Actors: " + MovieTimes::Movies.last.actors
        puts "Plot: " + MovieTimes::Movies.last.plot
        puts "Awards: " + MovieTimes::Movies.last.awards
        puts
        puts
    end
end