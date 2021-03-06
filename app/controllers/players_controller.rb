class PlayersController < ApplicationController
  before_action :set_up, only: :show
  before_action :move_to_index, except: [:index, :show, :search]
  
  
  def index
    @players = Player.all.order("created_at DESC").page(params[:page]).per(8)
  end

  def new
    @player = Player.new
  end

  def create
    Player.create(player_params)
    redirect_to root_path, alert: "選手を登録しました"
  end

  def destroy
    player = Player.find(params[:id])
    player.destroy
    redirect_to root_path, alert: "選手を削除しました"
  end

  def show
    @comment = Comment.new()
    @comments = @player.comments.includes(:user)
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    player.update(player_params)
    redirect_to root_path, alert: "選手を編集しました"
  end

  def search
    @players = Player.search(params[:keyword])
  end

  private 
  def player_params
    params.require(:player).permit(:image, :name, :country_id, :position_id, :age_id, :text).merge(user_id: current_user.id)
  end

  def set_up
    @player = Player.find(params[:id])
  end 

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end


end
