class CountryFacade
  def self.random_country
    countries_data = Rails.cache.fetch("all_countries", expires_in: 30.days) do
      puts 'loading countries...'
      CountryService.all_countries
    end 
    country_names = countries_data.map do |country|
      country[:name][:common]
    end
    name_sample(country_names)
  end

  def self.name_sample(names)
    names.sample
  end

  def self.capital_lat_lng(country_name)
    country = CountryService.country_by_name(country_name)
    country[0][:capitalInfo][:latlng]
  end
end