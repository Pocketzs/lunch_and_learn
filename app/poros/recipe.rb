class Recipe
  attr_reader :title,
              :url,
              :country,
              :image,
              :id,
              :type
  def initialize(recipe_data, query)
    @title = recipe_data[:label]
    @url = recipe_data[:url]
    @country = query
    @image = recipe_data[:image]
    @id = nil
    @type = "recipe"
  end
end