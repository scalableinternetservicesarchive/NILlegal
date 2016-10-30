class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment posted!"
      redirect_to show_dare_list_path
    else
      redirect_to show_dare_list_path
    end
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
