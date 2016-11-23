class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  skip_before_action :verify_authenticity_token

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment posted!"
    else
      flash[:danger] = "Failed to post comment"
    end
    redirect_to dare_path(id: @comment.dare_id)
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :dare_id)
    end

    def logged_in_user
      unless user_signed_in?
        flash[:danger] = "Please log in."
        redirect_to new_user_session_path
      end
    end
end
