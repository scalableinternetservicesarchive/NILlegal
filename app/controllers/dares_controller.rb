class DaresController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  skip_before_action :verify_authenticity_token

  def index
    if (params[:search])
      @dares = Dare.where("title like ?", "%#{params[:search]}%")
    else
      @dares = Dare.includes(:dare_submissions).includes(:comments).includes(:user).all
    end
  end

  def create
    @dare = current_user.dares.build(dare_params)
    if @dare.save
    # if @dare.valid?
    #   Dare.transaction do
    #     @dare.save
    #     @dare.transfer_points
    #   end
      flash[:success] = "Dare created!"
      redirect_to show_dare_list_path
    else
      render 'new'
    end
  end

  def new
    @dare = current_user.dares.build
  end

  def destroy
  end
  
  def show
    @dare = Dare.find_by(id: params[:id])
    @comments = @dare.comments
    if user_signed_in?
      @comment = current_user.comments.build if user_signed_in?
      @comment.dare_id = @dare.id
    end
    @submissions = @dare.dare_submissions
  end

  
  private

    def dare_params
      params.require(:dare).permit(:title, :karma_offer, :description)
    end

    def logged_in_user
      unless user_signed_in?
        flash[:danger] = "Please log in."
        redirect_to new_user_session_path
      end
    end
end
