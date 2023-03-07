class LearningResourcesFacade
  def self.country_resource(query)
    video = YoutubeFacade.video_resource(country_name)
    images = UnsplashFacade.image_resources(country_name)
    LearningResource.new(video, images, query)
  end
end