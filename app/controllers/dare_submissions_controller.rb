class DareSubmissionsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  skip_before_action :verify_authenticity_token
  
  def create
    @dare_submission = current_user.dare_submissions.build(dare_submission_params)
    if @dare_submission.valid? && !@dare_submission.dare.winning_submission_id.nil?
      flash[:danger] = "Submissions are Closed! Submission not created!"
      redirect_to dare_path(@dare_submission.dare.id)
    elsif @dare_submission.save
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
    dare = Dare.find_by(id: dare_submission_params[:dare_id])
    if (!dare.nil? && !dare.winning_submission_id.nil?)
      flash[:danger] = "Submissions are Closed! Submission not created!"
      redirect_to dare_path(dare.id)
    elsif (!dare.nil? )
      @dare_submission = current_user.dare_submissions.build(dare_submission_params)
    else
      flash[:danger] = "Cannot Submit to Nonexistent Dare"
      redirect_to show_dare_list_path
    end
  end
  
  def transfer_karma
    @dare = Dare.find_by(id: dare_submission_params[:dare_id])
    @dare_submission = DareSubmission.find_by(id: params[:dare_submission][:id])
    @dare_submission_user = @dare_submission.user
    if user_signed_in? && current_user.id == @dare.user_id && @dare.winning_submission_id.nil?
      begin
        DareSubmission.transaction do
          @dare_submission_user.karma_points = @dare_submission_user.karma_points + @dare.karma_offer
          @dare.winning_submission_id = @dare_submission.id
          @dare.save!
          @dare_submission_user.save!
          flash[:success] = "Karma rewarded!"
        end
        rescue => exception
          flash[:danger] = "Failed to perform transaction: #{exception}"
      end
      
      # @dare_submission_user.karma_points = @dare_submission_user.karma_points + @dare.karma_offer
      # if @dare_submission_user.save
      #   flash[:success] = "Karma rewarded!"
      # else
      #   redirect_to dare_path(@dare.id)
      # end
    else
      flash[:danger] = "No Karma awarded!"
    end
    redirect_to dare_path(@dare.id)
     
    
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
