require 'rails_helper'

RSpec.describe LearningResourcesFacade do
  describe 'class methods' do
    describe '.country_resource', :vcr do
      it 'returns a learning resource object given a country name' do
        resource = LearningResourcesFacade.country_resource('laos')

        expect(resource).to be_a(LearningResource)
      end
    end
  end
end