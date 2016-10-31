class DareSubmissionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def create
    @dare_submission = current_user.dare_submissions.build(dare_submission_params)
    
    if @dare_submission.save
      flash[:success] = "Dare Submission created!"
      redirect_to dare_path(@dare_submission.dare.id)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def destroy
  end
  
  def new
    @dare_submission = current_user.dare_submissions.build(dare_submission_params)
  end
  
  private
  
    

    def logged_in_user
      unless user_signed_in?
        flash[:danger] = "Please log in."
        redirect_to new_user_session_path
      end
    end
    
    def correct_user
      @dare_submission = current_user.dare_submission.find_by(id: params[:id])
      redirect_to root_url if @dare_submission.nil?
    end

    def dare_submission_params
      params.require(:dare_submission).permit(:content, :description, :dare_id)
    end

  
  
end
