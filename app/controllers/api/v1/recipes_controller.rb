class Api::V1::RecipesController < ApplicationController
  def index
    recipes = EdamamFacade.recipe_search(params[:country])
    render json: RecipeSerializer.new(recipes)
  end

  # def index
  #   if params[:country]
  #     recipes = EdamamFacade.recipe_search(params[:country])
  #   else
  #     random_country = CountryFacade.random_country
  #     recipes = EdamamFacade.recipe_search(random_country)
  #   end
  #   render json: RecipeSerializer.new(recipes)
  # end
end