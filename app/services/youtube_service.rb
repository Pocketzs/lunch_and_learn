class YoutubeService
  def self.video_search(query)
    response = conn.get('search', { q: "#{query} cuisine history", part: 'snippet', type: 'video', maxResults: 1 })
    parse_json(response)
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(
      url: 'https://www.googleapis.com/youtube/v3', 
      params: { key: ENV['youtube_api_key'] }
    )
  end
end