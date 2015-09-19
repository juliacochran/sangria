class User < ActiveRecord::Base
 class << self 
	 def from_omniauth(auth_hash)
	    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
	    user.name = auth_hash['info']['name']
	    user.email = auth_hash['info']['email']
	    user.oauth_token = auth_hash['token']
	    user.save!
	    user
	  end
  end
end
