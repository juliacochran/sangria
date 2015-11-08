class RemindersController < ApplicationController
	def self.send_welcome_email
		@user = User.find_by_id(1)
		NotifyMailer.welcome_email(@user).deliver
		# @user = User.new
		# @user.name = "test"
		# @user.email = "juliacochran7+" + Time.now + "@gmail.com"
		# @user.save
		
	end

 end