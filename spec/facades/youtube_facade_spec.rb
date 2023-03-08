require 'rails_helper'

RSpec.describe YoutubeFacade do
  describe 'class methods' do
    describe '.video_resource', :vcr do
      it 'returns a VideoResource object given a query' do
        video = YoutubeFacade.video_resource('thailand')
        
        expect(video).to be_a(VideoResource)
      end

      it 'returns an empty hash if the query doesnt return any video items' do
        empty_resource = YoutubeFacade.video_resource('oiausdhfiouashdfv')
      end
    end
  end
end