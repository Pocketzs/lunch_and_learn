require 'rails_helper'

RSpec.describe PlacesService do
  describe 'class methods' do
    describe '.tourist_sights', :vcr do
      it 'returns data for tourist sights given a country name in a 1000m radius' do
        tourist_sights = PlacesService.tourist_sights('France')
        expect(tourist_sights).to have_key(:features)
        expect(tourist_sights[:features]).to be_an(Array)
        tourist_sights[:features].each do |feature|
          expect(feature).to be_a(Hash)
          expect(feature).to have_key(:properties)
          expect(feature[:properties]).to have_key(:name)
          expect(feature[:properties]).to have_key(:formatted)
          expect(feature[:properties]).to have_key(:place_id)
        end
      end
    end
  end
end