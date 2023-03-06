class TouristSight
  attr_reader :id,
              :type,
              :name,
              :address,
              :place_id

  def initialize(data)
    @id = nil
    @type = 'tourist_sight'
    @name = data[:name]
    @address = data[:formatted]
    @place_id = data[:place_id]
  end
end