class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  #this creates the index where all listings can be displayed concurrently, also note that line 8 refers to the search bar, essentially stating that if a search
  #has been made, rails will filter or search_by the parameters of that search (search_params)
  def index
    if params[:search].present?
      @listings = Listing.search_by(search_params)
    else
      @listings = Listing.all
    end
  end 

  #this is empty as rails will render the show page implictly
  def show
  end 

  #a new instance of listing begins here and then moves to create
  def new
    @listing = Listing.new
  end 

  #this is where a new listing instance will transfer to, it sets the user relation to that instance as the currently logged in user, then will and redirect to the 
  #listing. If it fails it will re-render the new listing view. 
  def create
    @listing = current_user.listings.new(listing_params)
    @listing.user = current_user
    if @listing.save
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

  #this is also related to the search function
  def search_params
    params.require(:search).permit(:listing, :min_price, :max_price)
  end
end



