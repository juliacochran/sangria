OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], 
  scope: ['profile', 'email'],
  prompt: 'select_account',
  access_type: 'online'
end

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET'],
	scope: ['public_profile', 'email'],
	info_fields: 'id,name, email'
end