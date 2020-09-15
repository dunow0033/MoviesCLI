require 'uri'
require 'net/http'
require 'openssl'
require 'open-uri'
require 'json'

class API
    API_key = '943027A1-B7B7-4A74-81C4-C3C760B6F7AE'

    url = ("http://www.omdbapi.com/?apikey=e6fd8697&t=The%20Matrix")
    uri = URI.parse(url)

    response = Net::HTTP.get_response(uri)

    puts JSON.parse(response.read_body)
    # movies = JSON.parse(response.read_body)
    # movies.each do | movie |
    #     puts movie["Title"]
    # end
end