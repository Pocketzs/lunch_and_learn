class Api::V1::TouristSightsController < ApplicationController
  def index
    tourist_sights = PlacesFacade.tourist_sights(params[:country])
    render json: TouristSightSerializer.new(tourist_sights)
    # require 'pry'; binding.pry
  end
end