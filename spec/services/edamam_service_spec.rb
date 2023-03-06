require 'rails_helper'

RSpec.describe EdamamService do
  describe 'class methods' do
    describe '.recipe_search', :vcr do
      it 'returns an array hits of recipes given a query q' do
        response = EdamamService.recipe_search('Thailand')
      end
    end
  end
end