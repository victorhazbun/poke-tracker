# Preview all emails at http://localhost:3000/rails/mailers/signup
class SignupMailerPreview < ActionMailer::Preview
  def welcome_email
    SignupMailer.with(user: FactoryBot.build(:user)).welcome_email
  end
end
