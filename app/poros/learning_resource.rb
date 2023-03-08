class LearningResource
  attr_reader :country,
              :video,
              :images
  
  def initialize(video, images, query)
    @country = query
    @video = video
    @images = images
  end
end