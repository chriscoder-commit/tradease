class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end 

  #here to create a comment, first the parameters of a listing are found, as comments are actually 'attached' to listings, so the appropriate listing_id for the comment
  #is stored, for this purpose per lines 11 and 12. 
  def create
    @listing = Listing.find(params[:listing_id])
    @comment = @listing.comments.create(comment_params)
    @comment.user = current_user
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

  #this allows comments to be made by accepting certain attributes of the comments model, i.e. will accept the body of a comment here.
  def comment_params
    params.require(:comment).permit(:body)
  end 


end
