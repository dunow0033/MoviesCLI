require 'uri'
require 'net/http'
require 'openssl'
require 'open-uri'
require 'json'
require 'pry'

class MovieTimes::API
    API_key = "e6fd8697"
    @title = nil, @director = @nil, @date_released = nil, @rating = nil, @movie = nil

    def self.movieInfo(name)
        url = "http://www.omdbapi.com/?apikey=" + API_key + "&t=" + name
        uri = URI.parse(url)

        response = Net::HTTP.get_response(uri)

        # puts JSON.parse(response.read_body)
        movies = JSON.parse(response.read_body)
        movies.each do | key, value |
            if key == "Title"
                @title = "#{value}"
            elsif key == "Director"
                @director = "#{value}"
            elsif key == "Released"
                @date_released = "#{value}"
            elsif key == "Rated"
                @rating = "#{value}"
            end

            @movie = MovieTimes::Movies.new(@title, @director, @date_released, @rating)
        end

        #binding.pry
        # puts "Title: " + @title
        # puts "Director: " + @director
        # puts "Date released: " + @date_released
        # puts "Rating: " + @rating
    end

    #movieInfo("The Matrix")
end