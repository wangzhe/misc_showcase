class Notifier < ActionMailer::Base
  default :from => "android.thoughtworks@gmail.com"

  def signup_email(user, verify_code)
    @user = user
    @email = "#{user}@thoughtworks.com"
    @code = verify_code
    mail(:to => @email, :subject => "Welcome to ThoughtWorks WeChat Internal Account")
  end
end
