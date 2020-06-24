class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(player_id: params[:player_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @player = Player.find(params[:player_id])
    @favorite = current_user.favorites.find_by(player_id: @player.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
