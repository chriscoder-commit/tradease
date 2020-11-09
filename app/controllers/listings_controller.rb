class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

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
  
  def edit
    @listing = Listing.find(params[:id])
  end 

  def update
    @listing.update(listing_params)
    # @listing.update(name: params[:listing][:name], price: params[:listing][:price], available: params[:listing][:available], description: params[:listing][:description])
    redirect_to listings_path
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
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


