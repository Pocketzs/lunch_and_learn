require 'rails_helper'

RSpec.describe LearningResource do
  describe '#initialize', :vcr do
    it 'exists and has attributes' do
      query = 'thailand'
      video = YoutubeFacade.video_resource(query)
      images = UnsplashFacade.image_resources(query)
      lr = LearningResource.new(video, images, query)

      expect(lr).to be_a(LearningResource)
      expect(lr.country).to eq(query)
      expect(lr.video).to eq(video)
      expect(lr.images).to eq(images)
    end

    it 'handles no return queries' do
      query = 'liajsdhpoiashjdfopi'
      video = YoutubeFacade.video_resource(query)
      images = UnsplashFacade.image_resources(query)
      lr = LearningResource.new(video, images, query)

      expect(lr).to be_a(LearningResource)
      expect(lr.country).to eq(query)
      expect(lr.video).to eq({})
      expect(lr.images).to eq([])
    end
  end
end