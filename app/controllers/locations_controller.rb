class LocationsController < ApplicationController
  def index
    respond_to do |format|
      format.html {
        render template: 'welcome/index'
      }
      format.json {
        render json: Location.all
      }
    end
  end


  def show
    @location = Location.find params[:id]
  end

  def routes
    render json: Location.find( params[:id] ).routes
  end

  def index
    render json: Location.all
  end
end
