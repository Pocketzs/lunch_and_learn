require 'rails_helper'

RSpec.describe CountryFacade do
  describe 'class methods' do
    describe 'random_country', :vcr do
      it 'returns one random countrys name as a string' do
        allow(CountryFacade).to receive(:name_sample).and_return('Myanmar')

        expect(CountryFacade.random_country).to eq('Myanmar')
      end
    end

    describe 'capital_lat_long', :vcr do
      it 'returns an array of a capitals latitude and longitude given the capitals country' do
        lat_lng = CountryFacade.capital_lat_lng('France')
        expect(lat_lng).to eq([48.87,2.33])
      end
    end
  end
end