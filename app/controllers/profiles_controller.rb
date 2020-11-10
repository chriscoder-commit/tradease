class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]

  def index
    @profiles = Profile.all
  end 
  
  def show
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

  def set_profile
    id = params[:id]
    @profile = Profile.find(id)
  end 

  def profile_params
    params.require(:profile).permit(:name, :description, :place_of_business, :about_me, :skills)
  end 

end

