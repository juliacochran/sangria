class RemindersController < ApplicationController
	def self.send_welcome_email
		@user = User.find_by_id(1)
		NotifyMailer.welcome_email(@user).deliver
	end

	# Sends reminders to follow-up after an interview 
	def self.send_followup_reminders
		# For all users we have
		@allUsers = User.all
		@allUsers.each do |user|
			# get interactions for that user, maybe later breakdown by category
			@interactions = user.interactions
			@interactions.each do |event|
				today = Date.today
				if today - event.date <= 2
					NotifyMailer.followup_reminder(user, event).deliver
				end

			end
		end


	end

 end