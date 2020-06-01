class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to "/players/#{comment.player.id}" 
  end

  def show
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, player_id: params[:player_id])
  end

end
