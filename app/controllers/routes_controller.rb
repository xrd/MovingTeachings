class RoutesController < ApplicationController
  def index
    render json: Route.all
  end

  def stops
    route = Route.find params[:id]
    render json: route.stops
  end
end
