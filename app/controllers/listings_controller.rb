class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: %i[:show, :destroy]

  def index
    
  end 

  def show
  end 

  def new
  end 

  def create
  end 

  def update
  end 

  def destroy
  end 


  private

  def set_listing
    id = params[:id]
    @listing = Listing.find(id)
  end 

  def listing_params
    params.require(:listing).permit()
  end 
end
