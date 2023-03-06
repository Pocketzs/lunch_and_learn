require 'rails_helper'

RSpec.describe CountryService do
  describe 'class methods' do
    describe 'all_countries', :vcr do
      it 'returns data for all countries' do
        countries = CountryService.all_countries
        expect(countries).to be_an(Array)
        countries.each do |country|
          expect(country).to be_a(Hash)
          expect(country).to have_key(:name)
          expect(country[:name]).to have_key(:common)
          expect(country[:name][:common]).to be_a(String)
        end
      end
    end
  end
end