class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def destroy
    sign_out(current_user)
    redirect_to root_path
  end
end
