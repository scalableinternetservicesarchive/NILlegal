class DareSubmissionsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  
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

  def update
    if @dare_submission.update_attributes(dare_submission_params)
      flash[:success] = "Submission updated"
      redirect_to dare_path(@dare_submission.dare)
    else
      render 'edit'
    end
  end
  
  def destroy
  end
  
  def new
    if (!Dare.find_by(id: dare_submission_params[:dare_id]).nil? )
      @dare_submission = current_user.dare_submissions.build(dare_submission_params)
    else
      flash[:danger] = "Cannot Submit to Nonexistent Dare"
      redirect_to show_dare_list_path
    end
  end
  
  def transfer_karma
    @dare = Dare.find_by(id: dare_submission_params[:dare_id])
    @dare_submission = DareSubmission.find_by(id: dare_submission_params[:dare_submission_id])
    if user_signed_in?
      current_user.karma_points = current_user.karma_points - @dare.karma_offer
      @dare_submission.user.karma_points = @dare_submission.user.karma_points + @dare.karma_offer
      flash[:success] = "Karma transferred!"
    end
  end
  
  private
  
    def logged_in_user
      unless user_signed_in?
        flash[:danger] = "Please log in."
        redirect_to new_user_session_path
      end
    end
    
    def correct_user
      @dare_submission = current_user.dare_submissions.find_by(id: params[:id])
      redirect_to root_url if @dare_submission.nil?
    end

    def dare_submission_params
      params.require(:dare_submission).permit(:content, :description, :dare_id)
    end
  
end
