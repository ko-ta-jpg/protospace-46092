class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to prototype_path(@prototype)
    else
      redirect_to prototype_path(@prototype)
      #@prototype = @comment.prototype
      #@comments = @prototype.comments
      #render "prototypes/show", status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment)
          .permit(:content)
          .merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end