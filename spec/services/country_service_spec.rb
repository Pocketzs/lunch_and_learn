require 'rails_helper'

RSpec.describe CountryService do
  describe 'class methods' do
    describe '.all_countries', :vcr do
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

    describe '.country_by_name', :vcr do
      it 'returns data for a single country given a name' do
        country = CountryService.country_by_name('France')
        expect(country).to be_an(Array)
        expect(country.size).to eq(1)
        data = country[0]
        expect(data).to be_a(Hash)
        expect(data).to have_key(:capitalInfo)
        expect(data[:capitalInfo]).to have_key(:latlng)
        expect(data[:capitalInfo][:latlng]).to be_an(Array)
        data[:capitalInfo][:latlng].each do |e|
          expect(e).to be_a(Float)
        end
      end
    end
  end
end