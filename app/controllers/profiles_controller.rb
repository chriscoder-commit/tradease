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
    @profile.update(profile_params)
    redirect_to profile_path
  end

  private 

  def authorize_user
    unless current_user.id == @profile.user_id
      flash[:unauthorized] = "Not authorized"
      redirect_to listings_path
    end 
  end

  def set_profile
    id = params[:id]
    @profile = Profile.find(id)
  end 

  def profile_params
    params.require(:profile).permit(:name, :description, :place_of_business, :about_me, :skills)
  end 

end

