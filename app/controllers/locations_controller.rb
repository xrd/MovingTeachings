class LocationsController < ApplicationController
  def routes
    render json: Location.approved.find( params[:id] ).routes
  end

  def submit_request
    lowered = params[:name].downcase
    location = Location.find_or_create_by_canonical_name( lowered ) do |l|
      l.name = params[:name]
    end
    location.bump_requested if location
    render json: { status: 'ok' }
  end
  
  def show
  end
  
  def index
    render json: Location.approved.all
  end
end
