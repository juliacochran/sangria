class SessionsController < ApplicationController

  layout false

  def create
  #	render text: request.env['omniauth.auth'].to_yaml
  	@user = User.from_omniauth(request.env['omniauth.auth'])
  	session[:user_id] = @user.id
  	redirect_to root_path
  end

  def destroy
	  if current_user
	    session.delete(:user_id)
	    flash[:success] = 'See you!'
	  end
	  redirect_to root_path
	end
end
