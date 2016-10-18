class DaresController < ApplicationController
  
  def index
   @dares = Dare.all
  end

  def create
   @dare = current_user.dares.build(dare_params)
   if @dare.save
      flash[:success] = "Dare created!"
      redirect_to "/dares"
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

  
  
end
