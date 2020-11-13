class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
  end 

  def create
    @profile = Profile.find(params[:profile_id])
    @review = @profile.reviews.create(review_params)
    @review.user = current_user
    p @review.errors.full_messages
    if @review.save
      redirect_to @profile
    else
      redirect_to listings_path
    end 
  end 

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to profile_reviews_path
  end 


  private



  def review_params
    params.require(:review).permit(:body, :stars)
  end 


end

