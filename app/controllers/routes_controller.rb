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
    render json: Dialectic.all(limit: 10)
  end

  def tmpl
    render layout: false
  end

  def index
    respond_to do |format|
      format.html {
        render template: 'welcome/index'
      }
      format.json {
        render json: Route.all
      }
    end
  end
  
end
