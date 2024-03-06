class WelcomeMailer < ApplicationMailer
  default from: "from@example.com"
  def welcome_mail_to_user(user,template_name, data)
    @user = user
    @template = EmailTemplate.find_by(template_name: template_name)
    @content = EmailTemplate.change_variable(@template&.content, data)
    mail(to: @user.email, subject: "your data saved or updated")
  end
end
