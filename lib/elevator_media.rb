require "json"
require 'net/http'

module ElevatorMedia 
	class Streamer 


		
		def self.apiJoke
			uri = URI('https://v2.jokeapi.dev/joke/Programming')
			response = Net::HTTP.get(uri)
			joker = JSON.parse(response)
			if joker["joke"] == nil
				joker = joker["setup"] + " " + joker["delivery"]
			else
				joker = joker["joke"]
			end
			return joker
		end

		def self.getContent 
			joke = self.apiJoke
			output = "<div>#{joke}</div>"
			puts(output)
			return output
		end

	end
end
