class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show
    @submits = @user.submits
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile, :email, :image)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
