class ListingMailer < ApplicationMailer
  
  def send_listing_new_mail(user)
    @user = user
    mail( :to => @user.email, :subject => 'Thanks for expressing interest in this listing')
  end
end
