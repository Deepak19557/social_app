class Author < ApplicationRecord

	after_save :author_info,:send_mail

	def author_info
		MailJob.perform_later(self)
	end

	def send_mail
		data = {user_name: self.name, age: 16, h: 'health', w: 'wealth'}
		WelcomeMailer.welcome_mail_to_user(self, 'grapes_template', data).deliver_now
	end

	def display_name
		"#{email}"
	end

end
