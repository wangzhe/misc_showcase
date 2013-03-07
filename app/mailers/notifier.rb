class Notifier < ActionMailer::Base
  default :from => "android.thoughtworks@gmail.com"

  def signup_email(user)
    @user = "#{user}@gmail.com"
    puts @user
    mail(:to => @user, :subject => "Welcome to ThoughtWorks WeChat Internal Account")
  end
end
