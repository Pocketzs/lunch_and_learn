require 'rails_helper'

RSpec.describe EdamamFacade do
  describe 'class methods' do
    describe 'recipe_search', :vcr do
      it 'returns an array of recipe poros given a query' do
        recipes = EdamamFacade.recipe_search("Thailand")
        expect(recipes).to be_an(Array)
        recipes.each do |recipe|
          expect(recipe).to be_a(Recipe)
        end
      end

      it 'returns an empty array if query is an empty string' do
        recipes = EdamamFacade.recipe_search("")
        expect(recipes).to be_an(Array)
        expect(recipes).to be_empty
      end

      it 'returns an empty array if query is not given' do
        recipes = EdamamFacade.recipe_search
        expect(recipes).to be_an(Array)
        expect(recipes).to be_empty
      end
    end
  end
end