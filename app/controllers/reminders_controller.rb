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
			# get interactions for that user, maybe later break down by category
			@interactions = user.interactions
			@interactions.each do |event|
				today = Date.today
				if today - event.date > 0
					if not(event.followup) and event.contact.present?
						# if they haven't followed up and the event has a contact, notify
						# them via email to follow up
						NotifyMailer.followup_reminder(user, event).deliver
					end
				end
			end
		end
	end

end
