class CountryService
  def self.all_countries
    response = conn.get('all')
    parse_json(response)
  end

  def self.country_by_name(name)
    response = conn.get("name/#{name}")
    parse_json(response)
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(
      url: 'https://restcountries.com/v3.1'
    )
  end
end