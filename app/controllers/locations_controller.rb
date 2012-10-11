class LocationsController < ApplicationController
  def routes
    render json: Location.find( params[:id] ).routes
  end

  def index
    render json: Location.all
  end
end
