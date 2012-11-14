class FavoritesController < ApplicationController
  before_filter :require_login

  def create
    current_user.favorites.create dialectic_id: params[:dialectic_id]
    render json: { status: :ok }
  end

  def share
    respond_to do |format|
      format.html { render template: 'welcome/index' }
      format.js { render layout: false, template: 'favorites/share.html.haml' }
    end
  end
  
  def starred
    render layout: false
  end

  def index
    render json: current_user.favorites
  end
  
end
