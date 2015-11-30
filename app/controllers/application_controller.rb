class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	redirect_to(root_url) unless !current_user.nil?
  end

  """params passed through the endpoints are immutable so we have to make a new
  hash if we want to edit any params"""
  def deep_clone_params(params)
    new_params = {}
    params.each do |key, value|
      new_params[key] = value
    end
    return new_params
  end
end
