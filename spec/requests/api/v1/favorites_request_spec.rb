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
end