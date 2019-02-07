class SignupMailer < ApplicationMailer

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome to #{I18n.t :app_name}")
  end
end
