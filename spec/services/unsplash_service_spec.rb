require 'rails_helper'

RSpec.describe UnsplashService do
  describe 'class methods' do
    describe '.images_search', :vcr do
      it 'returns data for images given a query' do
        data = UnsplashService.images_search('thailand')
        expect(data).to be_a(Hash)
        expect(data).to have_key(:results)
        expect(data[:results]).to be_an(Array)
        data[:results].each do |result|
          expect(result).to have_key(:alt_description)
          expect(result).to have_key(:urls)
          expect(result[:alt_description]).to be_a(String)
          expect(result[:urls]).to be_a(Hash)
          expect(result[:urls]).to have_key(:raw)
          expect(result[:urls][:raw]).to be_a(String)
        end
      end
    end
  end
end