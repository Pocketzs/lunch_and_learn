class Api::V1::LearningResourcesController < ApplicationController
  def index
    resource = LearningResourcesFacade.country_resource(params[:country])
    render json: LearningResourceSerializer.new(resource)
  end
end