require 'rails_helper'

RSpec.describe 'Users API' do
  describe 'POST /api/v1/user' do
    it 'creates a user in the database' do
      user_params = ({ 
                      name: "Athena Dao",
                      email: "athenadao@bestgirlever.com"
                    })

      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      expect(json[:data]).to be_a(Hash)
      expect(json[:data]).to have_key(:id)
      expect(json[:data]).to have_key(:type)
      expect(json[:data]).to have_key(:attributes)
      expect(json[:data][:id]).to be_a(String)
      expect(json[:data][:type]).to eq('user')
      expect(json[:data][:attributes]).to be_a(Hash)
      expect(json[:data][:attributes]).to have_key(:name)
      expect(json[:data][:attributes]).to have_key(:email)
      expect(json[:data][:attributes]).to have_key(:api_key)
      expect(json[:data][:attributes][:name]).to be_a(String)
      expect(json[:data][:attributes][:email]).to be_a(String)
      expect(json[:data][:attributes][:api_key]).to be_a(String)
      
      created_user = User.last
      expect(created_user.name).to eq("Athena Dao")
      expect(created_user.email).to eq("athenadao@bestgirlever.com")
      expect(created_user.api_key).to be_a(String)
    end

    it 'returns an error if name is blank' do
      user_params = ({ 
                      name: "",
                      email: "athenadao@bestgirlever.com"
                    })

      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:errors][0][:detail]).to eq("Validation failed: Name can't be blank")
      expect(User.all).to be_empty
    end

    it 'returns an error if email is blank' do
      user_params = ({ 
                      name: "Bababooey",
                      email: ""
                    })

      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:errors][0][:detail]).to eq("Validation failed: Email can't be blank")
      expect(User.all).to be_empty
    end

    it 'returns an error if email is not unique' do
      og_user = create(:user)
      expect(User.count).to eq(1)
      user_params = ({ 
                      name: "Bababooey",
                      email: og_user.email
                    })

      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:errors][0][:detail]).to eq("Validation failed: Email has already been taken")
      expect(User.count).to eq(1)
    end
  end
end