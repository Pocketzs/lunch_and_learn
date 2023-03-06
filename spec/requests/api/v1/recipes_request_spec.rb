require 'rails_helper'

RSpec.describe 'Recipes API' do
  describe "GET /api/v1/recipes", :vcr do
    describe 'country=thailand' do
      it 'returns a an array of recipes given a query' do
        get "/api/v1/recipes?country=thailand"
        recipes = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(200)
        expect(response).to be_successful
        
        expect(recipes).to be_a(Hash)
        expect(recipes[:data]).to be_an(Array)
        recipes[:data].each do |recipe|
          expect(recipe).to have_key(:id)
          expect(recipe).to have_key(:type)
          expect(recipe).to have_key(:attributes)
          expect(recipe[:id]).to be_nil
          expect(recipe[:type]).to eq('recipe')
          expect(recipe[:attributes]).to be_a(Hash)
          attributes = recipe[:attributes]
          expect(attributes).to have_key(:title)
          expect(attributes).to have_key(:url)
          expect(attributes).to have_key(:country)
          expect(attributes).to have_key(:image)
          expect(attributes[:title]).to be_a(String)
          expect(attributes[:url]).to be_a(String)
          expect(attributes[:country]).to be_a(String)
          expect(attributes[:country]).to eq('thailand')
          expect(attributes[:image]).to be_a(String)
        end
      end

      it 'returns an empty data array if query is an empty string' do
        get "/api/v1/recipes?country="
        recipes = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(200)
        expect(response).to be_successful
        expect(recipes).to be_a(Hash)
        expect(recipes[:data]).to be_an(Array)
        expect(recipes[:data]).to be_empty
      end
    end

    describe 'no country param supplied' do
      it 'returns an array of recipes with a random country supplied' do
        allow(CountryFacade).to receive(:name_sample).and_return('Myanmar')

        get "/api/v1/recipes"
        # require 'pry'; binding.pry
      end
    end
  end
end