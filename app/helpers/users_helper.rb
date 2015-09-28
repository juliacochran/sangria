module UsersHelper
	require 'net/http'
	require 'rubygems'
	require 'json'

	def self.getUserId(accessToken)
		result = Net::HTTP.get(URI.parse('https://graph.facebook.com/me?fields=id&access_token=' + accessToken))
		return JSON.parse(result)["id"]
	end

end
