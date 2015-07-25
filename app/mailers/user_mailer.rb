class UserMailer < ApplicationMailer
  default from: 'admin@mangoes.com'

  def goodbye_email(user)
    @user = user
    @url = 'http://rottenmangoes.com/login'
    mail(to: @user.email, subject: 'Sad to see you go! Come back soon.')
  end
end
