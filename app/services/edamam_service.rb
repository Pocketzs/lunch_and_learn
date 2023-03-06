class EdamamService
  def self.recipe_search(query)
    response = conn.get(nil, { q: query })
    parse_json(response)
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(
      url: 'https://api.edamam.com/api/recipes/v2', 
      params: { app_id: ENV['edamam_app_id'], app_key: ENV['edamam_app_key'], type: 'public' }
    )
  end
end