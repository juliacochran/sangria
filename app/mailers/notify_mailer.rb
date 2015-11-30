class NotifyMailer < ApplicationMailer
	
	def welcome_email(user)
		@user = user
		message = 'Hi ' + @user.name + '! Welcome to Sangria.'
		mail(to: @user.email, subject: message)
	end

	def followup_reminder(user, interaction)
		@user = user
		@interaction = interaction
		@url = "www.sangriaapp.tk/interactions/" + @interaction.id.to_s + "/followup"
		@category = Interaction::get_category(@interaction.category)
		@company = @interaction.application.company.name
		message = @interaction.title + ' Follow-up Reminder'
		mail(to: @user.email, subject: message)
	end
end
