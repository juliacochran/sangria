module CompaniesHelper
	require 'net/http'
	require 'rubygems'
	require 'json'

	def self.getCompanyInfo(query, userip, useragent)
		result = Net::HTTP.get(URI.parse('http://api.glassdoor.com/api/api.htm?v=1&format=json&t.p=120&t.k=fz6JLNDfgVs&action=employers&q=' + query + '&userip='+ userip + '&useragent=' + useragent))
		if(JSON.parse(result)["success"] == true)
			return JSON.parse(result)["response"]
		else
			return JSON.parse(result)["response"]
		end
	end
end