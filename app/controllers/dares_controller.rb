class DaresController < ApplicationController
  
  def index
    @dares = Dare.all
  end

  def create
  end

  def destroy
  end
end
