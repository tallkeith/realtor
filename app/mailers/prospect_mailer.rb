class ProspectMailer < ActionMailer::Base
  default :from => "keithpnash@gmail.com"

  def welcome_email(prospect)
    @prospect = prospect
    @url = "http://tallrealtor.herokuapp.com"
    mail(:to => prospect.email, :bcc => "keithpnash@gmail.com", :subject => "Your home valuation")


end
