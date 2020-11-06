class TradesmenController < ApplicationController
  before_action :authenticate_user!


  def new
    @tradesman = Tradesman.new
  end
  
  def create
    current_user.tradesman = Tradesman.new
    current_user.tradesman.certification.attach(params[:tradesman][:certification])
    redirect_to listings_path 
  end 
  
end
