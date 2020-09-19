class MovieTimes::Movies
    attr_accessor :title, :director, :writer, :actors, :plot, :date_released, :rating, :awards

    @@movies = []

    def initialize(title, director, writer, actors, plot, date_released, rating, awards)
        @title = title
        @director = director
        @writer = writer
        @actors = actors
        @plot = plot
        @date_released = date_released
        @rating = rating
        @awards = awards
        @@movies << self
    end

    def self.all
        @@movies
    end

    def self.last
        @@movies.last
    end
end