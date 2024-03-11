class Author < ApplicationRecord

	# after_save :author_info,:send_mail

	# has_one_attached :image

	def self.ransackable_attributes(auth_object = nil)
    ["email", "id", "id_value", "name", "number"]
  end

  

	def author_info
		MailJob.perform_later(self)
	end

	def send_mail
		data = {user_name: self.name, age: 16, h: 'health', w: 'wealth'}
		WelcomeMailer.welcome_mail_to_user(self, 'grapes_template', data).deliver_now
	end



end
