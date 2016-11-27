class UserLeaderboardController < ApplicationController
  def index
    expires_in 1.minutes
    @users = User.all.order(karma_points: :desc ).limit(10)
  end
end
