class Api::V1::LearningResourcesController < ApplicationController
  def index
    require 'pry'; binding.pry
    LearningResourcesFacade.country_resource(params[:country])
  end
end