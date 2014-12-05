class CustomerMailer < ActionMailer::Base
  default from: "hazbun.app@gmail.com"

  def birthday_email(user)
		@user = user
		@url  = 'http://www.google.com'
		mail(to: @user.email, subject: 'Feliz Cumpleaños!')
  end




end
