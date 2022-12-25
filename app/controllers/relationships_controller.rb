class RelationshipsController < ApplicationController
  # フォローするとき
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end
  # フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer  
  end
  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
  # 相互フォロー一覧
  def frends
    user = User.find(params[:user_id])
    @frends = user.followings & @user.followers
  end

  def show
    user = User.find(params[:user_id])
    @followers = user.followers
    @followings = user.followings
    @frends = @followers & @followings
    if @frends != []
      @followers -= @frends
      @followings -= @frends
    end
  end
end