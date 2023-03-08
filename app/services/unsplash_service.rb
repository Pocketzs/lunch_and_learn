class UnsplashService
  def self.images_search(query)
    response = conn.get('search/photos', { query: query})
    parse_json(response)
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(
      url: 'https://api.unsplash.com', 
      headers: { Authorization: "Client-ID #{ENV['unsplash_access_key']}" }
    )
  end
end