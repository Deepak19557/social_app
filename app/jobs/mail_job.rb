class MailJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Author.all.each do |user|
    @user = user
    AuthorMailer.mail_to_author(@user).deliver_now
    # end
  end
end
