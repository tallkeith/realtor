class ProspectMailer < ActionMailer::Base
  default from: "from@example.com"
  				

  def welcome_email(user)
    @prospect = prospect
    @url  = 'http://tallrealtor.herokuapp.com'
    mail(to: @prospect.email, bcc: "keithpnash@gmail.com", subject: 'Thank you for your inquiry')
  end
end
