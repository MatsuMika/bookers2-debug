class RelationshipsController < ApplicationController
  before_action :set_user

   def followings
    @users = @user.followings.all
  end

  def followers
    @users = @user.followers.all
  end

  def create
  	@user = User.find(params[:user_id])
	following = current_user.follow(@user)
	redirect_to request.referer
  end

  def destroy
    following = current_user.unfollow(@user)
    following.destroy
    redirect_to request.referer
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

end
