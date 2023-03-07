class Api::V1::RecipesController < ApplicationController
  def index
    country = params[:country] ||= CountryFacade.random_country
    recipes = EdamamFacade.recipe_search(country)
    render json: RecipeSerializer.new(recipes)
  end
end