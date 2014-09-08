class ProspectMailer < ActionMailer::Base
  default :from => "Foop"
  def registration_confirmation(prospect)
    @prospect = prospect
    @url = "http://tallkeith.herokuapp.com"
    mail(:to => prospect.email, :bcc => "keithpnash@gmail.com", :subject => "Your home valuation")


end
