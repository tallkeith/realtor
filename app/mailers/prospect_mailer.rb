class ProspectMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @prospect = procpect
    @url  = 'http://example.com/login'
    mail(to: @prospect.email, subject: 'Welcome to My Awesome Site')
  end
end
