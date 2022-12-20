class SubmitsController < ApplicationController
  before_action :set_submit, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @submits = Submit.order('created_at DESC')
    @rank_submits = Submit.order(impressions_count: 'DESC')
    @rank_submits_index = Submit.order(impressions_count: 'DESC').limit(2)
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

  def show
    @comment = Comment.new
    @comments = @submit.comments
    impressionist(@submit, nil, unique: [:ip_address])
  end

  def edit
  end

  def update
    if @submit.update(submit_params)
      redirect_to submit_path(@submit)
    else
      render :edit
    end
  end

  def destroy
    if @submit.destroy
      redirect_to root_path
    else
      redirect_to :edit
    end
  end

  private

  def submit_params
    params.require(:submit).permit(:title, :content, :image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @submit.user
  end

  def set_submit
    @submit = Submit.find(params[:id])
  end
end