class MatchesController < ApplicationController
  def index
    @users = User.all
    @matches = Match.all
    @match_users = @users.select { |user| current_user.liked_by?(user) }
  end
  def show
    @user = User.find(params[:id])
  end

  def create
    like = current_user.active_matches.new(liked_id: params[:user_id])
    like.save
    redirect_to user_matches_path
  end
end
