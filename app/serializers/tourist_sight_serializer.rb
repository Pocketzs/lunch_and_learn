class TouristSightSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :address, :place_id
end