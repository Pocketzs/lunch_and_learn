class YoutubeFacade
  def self.video_resource(query)
    data = YoutubeService.video_search(query)[:items][0]
    return {} if data.nil?
    VideoResource.new(data)
  end
end