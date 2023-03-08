require 'rails_helper'

RSpec.describe "Learning Resources Api" do
  describe "GET /api/v1/learning_resources", :vcr do
    describe 'country=laos' do
      it 'returns data for a video and images for a given country(laos)' do
        get '/api/v1/learning_resources?country=laos'

        expect(response.status).to eq 200
        expect(response).to be_successful
        resource = JSON.parse(response.body, symbolize_names: true)

        expect(resource).to be_a(Hash)
        expect(resource).to have_key(:data)
        expect(resource[:data]).to be_a(Hash)
        expect(resource[:data]).to have_key(:id)
        expect(resource[:data]).to have_key(:type)
        expect(resource[:data]).to have_key(:attributes)
        expect(resource[:data][:id]).to be_nil
        expect(resource[:data][:type]).to eq('learning_resource')
        expect(resource[:data][:attributes]).to be_a(Hash)
        expect(resource[:data][:attributes]).to have_key(:country)
        expect(resource[:data][:attributes]).to have_key(:video)
        expect(resource[:data][:attributes]).to have_key(:images)
        expect(resource[:data][:attributes][:country]).to eq('laos')
        expect(resource[:data][:attributes][:video]).to be_a(Hash)
        expect(resource[:data][:attributes][:images]).to be_a(Array)
        
        expect(resource[:data][:attributes][:video]).to have_key(:title)
        expect(resource[:data][:attributes][:video]).to have_key(:youtube_video_id)
        expect(resource[:data][:attributes][:video][:title]).to be_a(String)
        expect(resource[:data][:attributes][:video][:youtube_video_id]).to be_a(String)
        
        resource[:data][:attributes][:images].each do |image|
          expect(image).to be_a(Hash)
          expect(image).to have_key(:alt_tag)
          expect(image).to have_key(:url)
          expect(image[:alt_tag]).to be_a(String)
          expect(image[:url]).to be_a(String)
        end
      end
    end
  end
end