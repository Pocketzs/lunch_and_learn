class Api::V1::RecipesController < ApplicationController
  # def index
  #   recipes = EdamamFacade.recipe_search(params[:country])
  #   render json: RecipeSerializer.new(recipes)
  # end

  # def index
  #   if params[:country]
  #     country = params[:country]
  #   else
  #     country = CountryFacade.random_country
  #   end
  #   recipes = EdamamFacade.recipe_search(country)
  #   render json: RecipeSerializer.new(recipes)
  # end
  def index
    country = params[:country] ||= CountryFacade.random_country
    # require 'pry'; binding.pry
    recipes = EdamamFacade.recipe_search(country)
    render json: RecipeSerializer.new(recipes)
  end
end