module CompaniesHelper
	require 'net/http'
	require 'rubygems'
	require 'json'

	def self.getCompanyInfo(query, userip, useragent)
		result = Net::HTTP.get(URI.parse('http://api.glassdoor.com/api/api.htm?v=1&format=json&t.p=43928&t.k=hplWT5dPKpo&action=employers&q=' + query + '&userip='+ userip + '&useragent=' + useragent))
		if(JSON.parse(result)["success"] == true)
			return JSON.parse(result)["response"]
		else
			return JSON.parse(result)["response"]
		end
	end
end