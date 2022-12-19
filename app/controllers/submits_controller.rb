class SubmitsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @submit = Submit.new
  end

  def create
    @submit = Submit.new(submit_params)
    if @submit.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def submit_params
    params.require(:submit).permit(:title, :content, :image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @submit.user
  end
end