class LearningResourcesFacade
  def self.country_resource(query)
    video = YoutubeFacade.video_resource(query)
    images = UnsplashFacade.image_resources(query)
    LearningResource.new(video, images, query)
  end
end