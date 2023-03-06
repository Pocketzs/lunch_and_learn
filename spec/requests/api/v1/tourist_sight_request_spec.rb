require 'rails_helper'

RSpec.describe 'Tourist Sights API' do
  describe "GET /api/v1/tourist_sights", :vcr do
    describe 'country=France' do
      it 'returns an array of tourist sights given a query' do
        get '/api/v1/tourist_sights?country=France'
        tourist_sights = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(response).to be_successful

        expect(tourist_sights).to be_a(Hash)
        expect(tourist_sights[:data]).to be_an(Array)
        tourist_sights[:data].each do |sight|
          expect(sight).to have_key(:id)
          expect(sight).to have_key(:type)
          expect(sight).to have_key(:attributes)
          expect(sight[:id]).to be_nil
          expect(sight[:type]).to eq("tourist_sight")
          expect(sight[:attributes]).to be_a(Hash)

          attributes = sight[:attributes]

          expect(attributes).to have_key(:name)
          expect(attributes).to have_key(:address)
          expect(attributes).to have_key(:place_id)
          expect(attributes[:name]).to be_a(String)
          expect(attributes[:address]).to be_a(String)
          expect(attributes[:place_id]).to be_a(String)
        end
      end
    end
  end
end