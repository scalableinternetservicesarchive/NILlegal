class CommentLikesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  skip_before_action :verify_authenticity_token
  
  def create
    @comment_like = current_user.comment_likes.build(like_params)
    @comment_like.user_id = current_user.id
    if @comment_like.save
      flash[:success] = "Liked successfully!"
    else
      flash[:danger] = "Failed to like comment"
    end
    redirect_to dare_path(id: Comment.find(like_params[:comment_id]).dare_id)
  end

  def destroy
  end
  
  private

    def like_params
      params.require(:comment_like).permit(:comment_id)
    end
    
    def logged_in_user
      unless user_signed_in?
        flash[:danger] = "Please log in."
        redirect_to new_user_session_path
      end
    end
end
