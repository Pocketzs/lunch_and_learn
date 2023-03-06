class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :url, :country, :image
end