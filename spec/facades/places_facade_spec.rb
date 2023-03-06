require 'rails_helper'

RSpec.describe PlacesFacade do
  describe 'class methods' do
    describe '.tourist_sights', :vcr do
      it 'returns an array of TouristSight objects' do
        tourist_sights = PlacesFacade.tourist_sights('France')
        expect(tourist_sights).to be_an Array
        tourist_sights.each do |tourist_sight|
          expect(tourist_sight).to be_a(TouristSight)
        end
      end
    end
  end
end