class FavoritesController < ApplicationController
  def create
    current_user.favorites.create dialectic_id: params[:dialectic_id]
    render json: { status: :ok }
  end

  def starred
    render layout: false
  end
  
  def index
    respond_to do |format|
      format.json { render json: current_user.favorites }
      format.html { render template: 'welcome/index' }
    end
  end
end
