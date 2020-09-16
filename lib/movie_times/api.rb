require 'uri'
require 'net/http'
require 'openssl'
require 'open-uri'
require 'json'
require 'pry'

class MovieTimes::API
    API_key = "e6fd8697"
    @title = nil, @director = @nil, @date_released = nil, @rating = nil

    def self.movieInfo(name)
        url = "http://www.omdbapi.com/?apikey=" + API_key + "&t=" + name

        uri = URI.parse(url)

        response = Net::HTTP.get_response(uri)

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
        end

        MovieTimes::Movies.new(@title, @director, @date_released, @rating)
    end

    def self.checkForInvalidMovie(name)
        url = "http://www.omdbapi.com/?apikey=" + API_key + "&t=" + name

        uri = URI.parse(url)

        response = Net::HTTP.get_response(uri)

        movies = JSON.parse(response.read_body)

        if movies.values[0] == "False"
            return nil
        else
            return true
        end
    end

    def self.scrapeTrivia
        #scrape a site for trivia about movie
    end
end