class UserNotifierMailer < ApplicationMailer
    default :from => 'rocketelevator@hotmail.com'
    default :content => 'halllooo'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_lead_email(lead)
    @lead = lead
    mail( :to => @lead.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end
end
