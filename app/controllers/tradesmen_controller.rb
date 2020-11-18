class TradesmenController < ApplicationController
  before_action :authenticate_user!


  def new
    @tradesman = Tradesman.new
  end
  
  #this is where a tradesman is made, as defined by certification beign attached - that is the current user becomes a tradesman through this model's association to the user model
  #this will then open up functionality, like being able to comment on posts.
  def create
    current_user.tradesman = Tradesman.new
    current_user.tradesman.certification.attach(params[:tradesman][:certification])
    redirect_to listings_path 
  end 
  
end
