class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    if params[:search].present?
      @listings = Listing.search_by(search_params)
    else
      @listings = Listing.all
    end
  end 

  def show
  end 

  def new
    @listing = Listing.new
  end 

  def create
    @listing = current_user.listings.new(listing_params)
    @listing.user = current_user
    if @listing.save
      puts "*************************************" 
      p current_user 
      puts "************************************************"
      ListingMailer.send_listing_new_mail(current_user).deliver
      redirect_to @listing, notice: 'Listing successfully created!'
    else
      render :new  
    end 
  end
  
  def edit
    @listing = Listing.find(params[:id])
  end 

  def update
    @listing.update(listing_params)
    redirect_to listings_path
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
  end 


  private

  def authorize_user
    unless current_user.id == @listing.user_id
      flash[:unauthorized] = "Not authorized"
      redirect_to listings_path
    end 
  end

  def set_listing
    id = params[:id]
    @listing = Listing.find(id)
  end 

  def listing_params
    params.require(:listing).permit(:name, :price, :available, :description, :picture)
  end 

  def search_params
    params.require(:search).permit(:listing, :min_price, :max_price)
  end
end



