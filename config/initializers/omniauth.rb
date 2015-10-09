OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['google_app_id'], ENV['google_app_secret'], 
  scope: ['profile', 'email'],
  prompt: 'select_account',
  access_type: 'online'
end

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, ENV['facebook_app_id'], ENV['facebook_app_secret'],
	scope: ['public_profile', 'email'],
	info_fields: 'id,name, email'
end