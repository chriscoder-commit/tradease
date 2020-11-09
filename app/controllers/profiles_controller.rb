class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end 

  def new
    @profile = Profile.new
  end 

  def create
    @profile = current_user.profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to @profile
    else 
      render :new
    end 
  end 

  def edit
  end 

  def update
  end

  private 

  def set_profile
    id = params[:id]
    @profile = Profile.find(id)
  end 

  def listing_params
    params.require(:profile).permit(:name, :description, :place_of_business, :about_me, :skills)
  end 

end

