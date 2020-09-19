require 'uri'
require 'net/http'
require 'openssl'
require 'open-uri'
require 'json'

class MovieTimes::API
    API_key = "e6fd8697"

    #this is the function that will use the API key and the name of the movie passed in as a parameter to retrieve the movie
     #trivia from the API
    def self.movieInfo(name)
        url = "http://www.omdbapi.com/?apikey=" + API_key + "&t=" + name

        #parsing the API URL
        uri = URI.parse(url)

        #getting response from the parsed URL
        response = Net::HTTP.get_response(uri)

        #getting the JSON string of the response
        movies = JSON.parse(response.read_body)

        #for each loop to get the necessary attributes from the hash value obtained
        movies.each do | key, value |
            if key == "Title"
                @title = "#{value}"
            elsif key == "Director"
                @director = "#{value}"
            elsif key == "Writer"
                @writer = "#{value}"
            elsif key == "Actors"
                @actors = "#{value}"
            elsif key == "Plot"
                @plot = "#{value}"
            elsif key == "Released"
                @date_released = "#{value}"
            elsif key == "Rated"
                @rating = "#{value}"
            elsif key == "Awards"
                @awards = "#{value}"
            end
        end

        #after each value is obtained from the for each loop above, make a new movie object using each of the values
        MovieTimes::Movies.new(@title, @director, @writer, @actors, @plot, @date_released, @rating, @awards)
    end

    #this function checks for a valid movie title being entered
    def self.checkForInvalidMovie(name)

        #it grabs the API URL, just like the beginning of the trivia obtaining function
        url = "http://www.omdbapi.com/?apikey=" + API_key + "&t=" + name

        uri = URI.parse(url)

        response = Net::HTTP.get_response(uri)

        movies = JSON.parse(response.read_body)

        #except this time, it checks the first value of the hash obtained to see whether or not it
        #matches the value of False.  I discovered that the API gives an error message when asked for
        #an invalid movie title, and used that error message, to make this if test
        if movies.values[0] == "False"
            return nil
        else
            return true
        end
    end
end