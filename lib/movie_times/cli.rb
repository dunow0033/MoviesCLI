class CLI
    def main
        greet_user
        fetch_movie_data
    end
    
    def greet_user
        puts "Welcome to the movie info app!!"
    end

    def prompt_for_movie_info
        puts "Which movie would you like to learn more about: "
    end

    def fetch_movie_data
        puts "Use API file to grab movie data!!"
    end
end