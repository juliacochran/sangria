class RemindersController < ApplicationController
	def send_welcome_email
		# @user = current_user
		# NotifyMailer.welcome_email(@user).deliver
		@user = User.new
		@user.name = "test"
		@user.email = "juliacochran7+" + Time.now + "@gmail.com"
		@user.save
		
	end

 end