class UserLeaderboardController < ApplicationController
  def index
    @users = User.all.order(karma_points: :desc ).limit(10)
  end
end
