require 'rails_helper'

RSpec.describe EdamamService do
  describe 'class methods' do
    describe '.recipe_search', :vcr do
      it 'returns first 20 hits of recipes given a query q' do
        response = EdamamService.recipe_search('Thailand')
        hits = response[:hits]

        hits.each do |h|
          expect(h).to have_key(:recipe)
          expect(h[:recipe]).to be_a(Hash)
          expect(h[:recipe]).to have_key(:label)
          expect(h[:recipe]).to have_key(:url)
          expect(h[:recipe]).to have_key(:image)
          expect(h[:recipe][:label]).to be_a(String)
          expect(h[:recipe][:url]).to be_a(String)
          expect(h[:recipe][:image]).to be_a(String)
        end
      end

      it 'returns an empty hits array if query is not given' do
        response = EdamamService.recipe_search
        expect(response[:hits]).to be_an(Array)
        expect(response[:hits]).to be_empty
      end

      it 'returns an empty hits array if query is blank' do
        response = EdamamService.recipe_search('')
        expect(response[:hits]).to be_an(Array)
        expect(response[:hits]).to be_empty
      end
    end
  end
end