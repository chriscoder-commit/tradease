class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end 

  def create
    @listing = Listing.find(params[:listing_id])
    @comment = @listing.comments.create(comment_params)
    @comment.user = current_user
    p @comment.errors.full_messages
    if @comment.save
      redirect_to @listing
    else
      redirect_to listings_path
    end 
  end 

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to listing_comments_path
  end 


  private 


  def comment_params
    params.require(:comment).permit(:body)
  end 


end
