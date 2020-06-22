class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to "/players/#{@comment.player_id}"  }
      format.json
    end
  end

  def show
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, player_id: params[:player_id])
  end

  
end
