# -*- encoding: UTF-8 -*-
require 'forecast_io'

class Weather

	attr_accessor :forecast

	def initialize(attributes = {})
		ForecastIO.api_key = ENV['FORECAST_IO_KEY']
		@address   = attributes[:address]
		@geo = Geo.new(:address => @address, :lang => :ja)
		@forecast  = Forecast.new(location: @geo, time: attributes[:time])
	end

	class Forecast

		attr_accessor :time

		def initialize(attributes = {})
			ForecastIO.api_key = ENV['FORECAST_IO_KEY']
			@time = attributes[:time]
			@subject = ForecastIO.forecast(
				attributes[:location].latitude, 
				attributes[:location].longitude, 
				time: attributes[:time], 
				params: { units: 'si' }
			)
		end

		def weather
			return "" unless data
			case data.icon
			when 'clear-day'
				return "晴れ"
			when 'clear-night'
				return "夜晴れ"
			when 'rain'
				return "雨"
			when 'snow'
				return "雪"
			when 'sleet'
				return "みぞれ"
			when 'wind'
				return "風"
			when 'fog'
				return "霧"
			when 'cloudy'
				return "曇り"
			when 'partly-cloudy-day'
				return "時々曇り"
			when 'partly-cloudy-night'
				return "夜時々曇り"
			else
				return ""
			end
		end

		def weather_icon
			return "" unless data
			case data.icon
			when 'clear-day'
				return "wi-day-sunny"
			when 'clear-night'
				return "wi-day-sunny"
			when 'rain'
				return "wi-rain"
			when 'snow'
				return "wi-snow"
			when 'sleet'
				return "wi-snow"
			when 'wind'
				return "wi-night-alt-cloudy-windy"
			when 'fog'
				return "wi-fog"
			when 'cloudy'
				return "wi-cloudy"
			when 'partly-cloudy-day'
				return "wi-cloudy"
			when 'partly-cloudy-night'
				return "wi-cloudy"
			else
				return ""
			end
		end

		def temperature
			return "" unless data
			data.temperature.round.to_s + "℃"
		end

		private 

		def data
			@subject.currently if @subject
		end

	end

end
