require 'rails_helper'

RSpec.describe VideoResource do
  describe '#initialize' do
    it 'exists and has attributes' do
      data = {
        :kind=>"youtube#searchResult",
        :etag=>"E336lIH2gA3l8TtLq_fKFNPEmC4",
        :id=>{:kind=>"youtube#video", :videoId=>"Oe3LCcDS-Uw"},
        :snippet=>
          {:publishedAt=>"2021-05-08T17:16:36Z",
          :channelId=>"UCyEA3vUnlpg0xzkECEq1rOA",
          :title=>"The Dirty History of Thai Food",
          :description=>"Pad Thai is not what you think... Thank you Surfshark for sponsoring this video. Go tohttps://surfshark.deals/ANDONG and enter ...",
          :thumbnails=>
            {:default=>{:url=>"https://i.ytimg.com/vi/Oe3LCcDS-Uw/default.jpg", :width=>120, :height=>90},
            :medium=>{:url=>"https://i.ytimg.com/vi/Oe3LCcDS-Uw/mqdefault.jpg", :width=>320, :height=>180},
            :high=>{:url=>"https://i.ytimg.com/vi/Oe3LCcDS-Uw/hqdefault.jpg", :width=>480, :height=>360}},
          :channelTitle=>"My Name Is Andong",
          :liveBroadcastContent=>"none",
          :publishTime=>"2021-05-08T17:16:36Z"}
      }
      
      video = VideoResource.new(data)
      expect(video).to be_a(VideoResource)
      expect(video.title).to eq("The Dirty History of Thai Food")
      expect(video.youtube_video_id).to eq("Oe3LCcDS-Uw")
    end
  end
end