class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end 

  def create
    @listing = Listing.find(params[:listing_id])
    @comment = @listing.comments.new(comment_params)
    if @comment.save
      redirect_to listings_path
    else
      render :new 
    end 
  end 

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to listings_path 
  end 


  private 


  def comment_params
    params.require(:comment).permit(:body)
  end 


end
