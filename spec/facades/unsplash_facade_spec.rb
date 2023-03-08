require 'rails_helper'

RSpec.describe UnsplashFacade do
  describe 'class methods' do
    describe '.image_resources', :vcr do
      it 'returns an array of ImageResource objects given a query' do
        images = UnsplashFacade.image_resources('thailand')

        expect(images).to be_an(Array)
        images.each do |image|
          expect(image).to be_an(ImageResource)
        end
      end

      it 'returns an empty array if the query doesnt return any images' do
        empty_resources = UnsplashFacade.image_resources('ioauwsdhfvouiqwner')
        expect(empty_resources).to be_an(Array)
        expect(empty_resources).to be_empty
      end
    end
  end
end