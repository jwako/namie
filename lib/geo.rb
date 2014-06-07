require 'geocoder'

class Geo

	attr_accessor :latitude, :longitude

	def initialize(attributes = {})
		Geocoder.configure(:language => attributes[:lang], :units => :km)
		@address   = attributes[:address]
		@latitude  = Geocoder.coordinates(@address)[0]
		@longitude = Geocoder.coordinates(@address)[1]
	end

end