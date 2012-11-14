class RoutesController < ApplicationController

  def samples
    render json: Dialectic.all( limit: 10 )
  end
  
  def stops
    route = Route.find params[:id]
    render json: route.stops
  end

  def dialectics
    route = Route.find params[:id]
    render json: route.dialectics
  end

  def alternatives
    render json: Dialectic.approved.all(limit: 10)
  end

  def index
    render json: Route.all
  end
  
end
