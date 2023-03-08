class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by_api_key!(params[:api_key])
    user.favorites.create!(favorite_params)
    render json: { success: "Favorite added successfully"}, status: :created
  end

  def index
    user = User.find_by_api_key!(params[:api_key])
    favorites = user.favorites
    render json: FavoriteSerializer.new(favorites)
  end

  private

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end