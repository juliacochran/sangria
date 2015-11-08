class RemindersController < ApplicationController
	def self.send_welcome_email
		@user = User.find_by_id(1)
		NotifyMailer.welcome_email(@user).deliver
		# @user = User.new
		# @user.name = "test"
		# @user.email = "juliacochran7+" + Time.now + "@gmail.com"
		# @user.save
		
	end

	# Sends reminders to follow-up after an interview 
	def self.send_followup_reminders
		# For all users we have
		@user = User.find_by_id(1)
		# get interactions for that user, maybe later breakdown by category
		@interactions = @user.interactions
	#	NotifyMailer.followup_reminder(@user, @interactions).deliver
		@interactions.each do |event|
			today = Date.today
			if today - event.date < 2
				NotifyMailer.followup_reminder(@user, @interactions).deliver
			end

		end



	end

 end