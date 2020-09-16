class MovieTimes::Movies
    attr_accessor :title, :director, :date_released, :rating

    @@movies = []

    def self.movie_loop
        #I think this method will really be used to get info from the API class
        the_matrix = self.new("The Matrix", "Andy and Larry Wachowski", 1999, "R")
        gladiator = self.new("Gladiator", "Ridley Scott", 2000, "R")
        the_departed = self.new("The Departed", "Martin Scorsese", 2006, "R")
        limitless = self.new("Limitless", "Neil Berger", 2011, "PG-13")
    end

    def initialize(title, director, date_released, rating)
        @title = title
        @director = director
        @date_released = date_released
        @rating = rating
        @@movies << self
    end

    def self.all
        @@movies
    end
end