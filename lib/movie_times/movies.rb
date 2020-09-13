class Movies
    attr_accessor :title, :director, :year_released, :rating

    @@movies = []

    def initialize(title, director, year_released, rating)
        @title = title
        @director = director
        @year_released = year_released
        @rating = rating
        @@movies << self
    end

    def self.movie_loop
        the_matrix = self.new("The Matrix", "Andy and Larry Wachowski", 1999, "R")
        gladiator = self.new("Gladiator", "Ridley Scott", 2000, "R")
        the_departed = self.new("The Departed", "Martin Scorsese", 2006, "R")
        limitless = self.new("Limitless", "Neil Berger", 2011, "PG-13")
    end

    def self.all
        @@movies
    end

    def self.grab_API_info
        "Grab API info!!"
    end
end