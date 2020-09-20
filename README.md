<<<<<<< HEAD
# MovieTimes

This app gives trivia about movie titles that the user enters

Descriptions for each class used:

cli class -- loop taking in user input of movie title, calling api class
		on each selection.  loop first checks for valid movie title, and after the first set of trivia,
    it asks the user if they want to see more trivia.  they can see more trivia or move on to the 
    next movie.loop ends when user enters 'q'

	movies class -- initialized and defines the characteristics of each movie:

		title, director, writer, actors, plot, date released, rating, awards

		has array containing all movies entered, and a last method retrieving the last
		movie selected to display the information for the movie that was just entered

  api class -- forms the url from the api containing the movie facts, parsed the json from this url
		loops through each json object, grabbing the facts from the json object

		after that loop is completed, makes a movie object containing the movie facts obtained
		from the loop

    also contains a function to check if the movie title entered was valid or not

## Installation

  Add this line to your application's Gemfile:
    gem 'movie-times'

  And then:

  1.  clone github repository
  2.  run "bundle install"
  3.  run "ruby/bin/movie-times"

## Usage

when running the app, enter a movie title at the first prompt.  You will get a response giving you four bits of movie trivia.  You will then be asked
if you want some additional movie trivia.  You can enter 'y' to get the next bit of movie trivia or 'n' to enter a different movie.  At this prompt,
if you enter an invalid response, you will be taken back to the beginning of the app and asked to enter a different movie title.  If you hit 'y',
you will be taken back to the beginning to be asked for a different movie title again, and the process starts all over again.  If you hit 'q' at either
prompt where you are asked for a movie title, you will exit the program.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dunow33/movie_times. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/dunow33/movie_times/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MovieTimes project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/movie_times/blob/master/CODE_OF_CONDUCT.md).
=======
# Movies-API
>>>>>>> b71c470778c365c7e4c5867dfde77d5d90a34b21
