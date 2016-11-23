class SubmissionLikesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  skip_before_action :verify_authenticity_token
  
  def create
    @submission_like = current_user.submission_likes.build(like_params)
    @submission_like.user_id = current_user.id
    if @submission_like.save
      flash[:success] = "Liked successfully!"
    else
      flash[:danger] = "Failed to like submission"
    end
    redirect_to dare_path(id: DareSubmission.find(like_params[:dare_submission_id]).dare_id)
  end

  def destroy
  end
  
  private

    def like_params
      params.require(:submission_like).permit(:dare_submission_id)
    end
    
    def logged_in_user
      unless user_signed_in?
        flash[:danger] = "Please log in."
        redirect_to new_user_session_path
      end
    end
end
