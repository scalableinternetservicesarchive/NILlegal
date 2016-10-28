class DaresController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def index
    @dares = Dare.all
  end

  def create
    @dare = current_user.dares.build(dare_params)
    if @dare.save
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
  
  private

    def dare_params
      params.require(:dare).permit(:title, :description)
    end

    def logged_in_user
      unless user_signed_in?
        flash[:danger] = "Please log in."
        redirect_to new_user_session_path
      end
    end
end
