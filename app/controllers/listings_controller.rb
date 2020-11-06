class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: %i[:show, :destroy]

  def index
    @listings = Listing.all
  end 

  def show
  end 

  def new
    @listing = Listing.new
  end 

  def create
    @listing = current_user.listings.new(listing_params)
    @listing.save
    redirect_to listings_path
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
    params.require(:listing).permit(:name, :price, :available, :description)
  end 
end


