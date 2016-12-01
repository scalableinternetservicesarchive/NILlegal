class UserLeaderboardController < ApplicationController
  def index
    @users = User.all.order(karma_points: :desc ).limit(10)
    fresh_when(@users)
  end
end
