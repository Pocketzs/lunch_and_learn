class PlacesService
  def self.tourist_sights(country_name)
    latitude,longitude = CountryFacade.capital_lat_lng(country_name)
    response = conn.get(nil, {categories: 'tourism.sights', filter: "circle:#{longitude},#{latitude},1000"})
    parse_json(response)
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(
      url: 'https://api.geoapify.com/v2/places',
      params: {apiKey: ENV['places_api_key']}
    )
  end
end