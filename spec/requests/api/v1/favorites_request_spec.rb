require 'rails_helper'

RSpec.describe 'Favorites API' do
  describe 'POST /api/v1/favorites' do
    it 'creates a favorite for a user' do
      user = create(:user)

      favorite_params = ({
                          api_key: user.api_key,
                          country: "thailand",
                          recipe_link: "https://www.tastingtable.com",
                          recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
                        })

      headers = { "CONTENT_TYPE" => "application/json" }

      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite_params)
      
      expect(response).to be_successful
      expect(response.status).to eq(201)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:success)
      expect(json[:success]).to eq("Favorite added successfully")

      created_favorite = Favorite.last
      expect(created_favorite).to eq(User.last.favorites.last)
      expect(created_favorite.country).to eq("thailand")
      expect(created_favorite.recipe_link).to eq("https://www.tastingtable.com")
      expect(created_favorite.recipe_title).to eq("Crab Fried Rice (Khaao Pad Bpu)")
    end

    it 'returns an error if the api key is invalid' do
      favorite_params = ({
                          api_key: 'not a real key',
                          country: "thailand",
                          recipe_link: "https://www.tastingtable.com",
                          recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
                        })

      headers = { "CONTENT_TYPE" => "application/json" }

      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite_params)
      
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:errors][0][:detail]).to eq("Couldn't find User")
      expect(Favorite.all).to be_empty
    end
  end

  describe 'GET /api/v1/favorites' do
    describe '?api_key=<valid key>' do
      it "returns a user's favorite recipes" do
        user = create(:user)
        create_list(:favorite, 5, user_id: user.id)

        get "/api/v1/favorites?api_key=#{user.api_key}" 

        expect(response).to be_successful
        expect(response.status).to eq(200)
        favorites = JSON.parse(response.body, symbolize_names: true)
        expect(favorites).to be_a(Hash)
        expect(favorites).to have_key(:data)
        expect(favorites[:data]).to be_an(Array)
        expect(favorites[:data].count).to eq(5)

        favorites[:data].each do |favorite|
          expect(favorite).to have_key(:id)
          expect(favorite).to have_key(:type)
          expect(favorite).to have_key(:attributes)
          expect(favorite[:id]).to be_a(String)
          expect(favorite[:type]).to eq("favorite")
          expect(favorite[:attributes]).to be_a(Hash)
          expect(favorite[:attributes]).to have_key(:recipe_title)
          expect(favorite[:attributes]).to have_key(:recipe_link)
          expect(favorite[:attributes]).to have_key(:country)
          expect(favorite[:attributes]).to have_key(:created_at)
          expect(favorite[:attributes][:recipe_title]).to be_a(String)
          expect(favorite[:attributes][:recipe_link]).to be_a(String)
          expect(favorite[:attributes][:country]).to be_a(String)
          expect(favorite[:attributes][:created_at]).to be_a(String)
        end
      end

      it 'returns an error if api key is invalid' do
        get "/api/v1/favorites?api_key=not a real key" 

        expect(response).to_not be_successful
        expect(response.status).to eq(404)
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error[:errors][0][:detail]).to eq("Couldn't find User")
      end

      it 'returns empty array if user has no favorites' do
        user = create(:user)

        get "/api/v1/favorites?api_key=#{user.api_key}" 

        expect(response).to be_successful
        expect(response.status).to eq(200)
        favorites = JSON.parse(response.body, symbolize_names: true)
        expect(favorites).to be_a(Hash)
        expect(favorites).to have_key(:data)
        expect(favorites[:data]).to be_an(Array)
        expect(favorites[:data]).to be_empty
      end
    end
  end
end