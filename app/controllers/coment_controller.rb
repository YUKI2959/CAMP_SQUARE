class ComentController < ApplicationController
  def create
    @comment = Coment.new(comment_params)
    if @comment.save
      redirect_to submit_path(@comment.submit_id)
    else
      @submit = Submit.find(params[:submit_id])
      @comments = @submit.comments
      render "submits/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:coment).merge(user_id: current_user.id, submit_id: params[:submit_id])
  end
end
