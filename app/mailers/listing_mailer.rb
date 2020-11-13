class ListingMailer < ApplicationMailer
  default :from => 'cam022007@coderacademy.edu.au'

  def send_listing_new_mail(user)
    @user = user
    puts "********************************************"
    p @user
    puts "*****************************************************"
    mail( :to => @user.email, :subject => 'Thanks for expressing interest in this listing')
  end
end
