class ProspectMailer < ActionMailer::Base
  default :from => "contact@bakersfieldhomeworth.com"

  def welcome_email(prospect)
    @prospect = prospect
    @url = ENV["URL"]
    mail(:to => prospect.email, :bcc => "contact@bakersfieldhomeworth.com", :subject => "Your Home Valuation")
  end

end
