class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :profile_listings]
  before_action :authorize_user, only: [:edit, :update, :profile_listings]

  def index
    @profiles = Profile.all
  end 
  
  def show
    @review = Review.new
  end 

  def profile_listings
  @listings = current_user.listings
  end 

  def new
    @profile = Profile.new
  end 

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save 
      redirect_to listings_path
    else
      render :new
    end 
  end 

  def edit
    @profile = Profile.find(params[:id])
  end 

  def update
    if @profile.update(profile_params)
      redirect_to profile_path
    else 
      render :edit
    end 
  end

  private 

  #this is an example of authorizations that prevents people accessing profiles exception in a situation I have allowed through the comments.
  def authorize_user
    unless current_user.id == @profile.user_id
      flash[:unauthorized] = "Not authorized"
      redirect_to listings_path
    end 
  end

  #this sets a profile where it is relevant, such as for the show action above, and will happen before the show action (for example) executes due to the before_action
  def set_profile
    id = params[:id]
    @profile = Profile.find(id)
  end 

  #this sets the allowed parameters that users can enter ino the application in conjunction with its before_action
  def profile_params
    params.require(:profile).permit(:name, :description, :place_of_business, :about_me, :skills)
  end 

end

