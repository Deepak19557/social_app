class AuthorMailer < ApplicationMailer

  def mail_to_author(author)
    mail(to: author.email, subject: "your data saved or updated")
  end
end
