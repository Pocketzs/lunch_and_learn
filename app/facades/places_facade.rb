class PlacesFacade
  def self.tourist_sights(country_name)
    features = PlacesService.tourist_sights(country_name)[:features]
    features.map do |feature|
      properties = feature[:properties]
      TouristSight.new(properties)
    end
  end
end