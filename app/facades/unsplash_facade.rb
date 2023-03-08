class UnsplashFacade
  def self.image_resources(query)
    data = UnsplashService.images_search(query)[:results]
    data.map do |datum|
      ImageResource.new(datum)
    end
  end
end