class AppMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.app_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail :to => user.email, :subjetc => 'Password reset'
  end
end
