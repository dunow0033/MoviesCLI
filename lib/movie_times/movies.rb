class MovieTimes::Movies

    #attribute accessors for every movie attribute
    attr_accessor :title, :director, :writer, :actors, :plot, :date_released, :rating, :awards

    #array to store every movie entered by the user.  if this app were to get fleshed out more,
    #i would have liked the ability to ask the user if they wanted to display information about any
    #of the movies they had already entered.  storing the movies as they are entered would make that
    #possible.
    @@movies = []

    #intializes each movie as it's entered with the 8 characteristics that the API class is retrieving
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

    #returns the entire array for potential future functionality
    def self.all
        @@movies
    end

    #retrieves the last movie entered, which is necessary to get the last movie's trivia from the array
    def self.last
        @@movies.last
    end
end