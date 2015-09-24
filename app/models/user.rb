class User < ActiveRecord::Base
  validates_format_of :name, with: /\A([a-zA-Z0-9\.\' ]+)\z/i, on: :create
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

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
