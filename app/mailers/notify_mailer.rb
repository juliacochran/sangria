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
		message = 'Have you followed-up after ' + @interaction.title + '?'
		mail(to: @user.email, subject: message)
	end
end
