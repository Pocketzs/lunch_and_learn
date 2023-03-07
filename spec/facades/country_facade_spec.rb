require 'rails_helper'

RSpec.describe CountryFacade do
  describe 'class methods' do
    describe 'random_country', :vcr do
      it 'returns one random countrys name as a string' do
        allow(CountryFacade).to receive(:name_sample).and_return('Myanmar')

        expect(CountryFacade.random_country).to eq('Myanmar')
      end
    end
  end
end