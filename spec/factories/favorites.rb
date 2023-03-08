FactoryBot.define do
  factory :favorite do
    country { Faker::Address.country }
    recipe_link { "#{Faker::Restaurant.name.gsub(/\s+/, "")}Recipes.com" }
    recipe_title { Faker::Food.dish }
    user { nil }
  end
end
