class EdamamFacade
  def self.recipe_search(query = nil)
    data = EdamamService.recipe_search(query)[:hits]
    recipes = data.map do |datum|
      recipe_data = datum[:recipe]
      Recipe.new(recipe_data, query)
    end
  end
end