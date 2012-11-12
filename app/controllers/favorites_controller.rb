class FavoritesController < ApplicationController
  def create
    current_user.favorites.create dialectic_id: params[:dialectic_id]
    render json: { status: :ok }
  end

  def share
    File.open( File.join( Rails.root, "tmp", "#{(rand()*1000).to_i}.request.yml" ), "w+" ) do |f|
      f.write request.to_yaml
    end
    respond_to do |format|
      format.html {
        logger.info "Rendering HTML"
        render template: 'welcome/index'
      }
      format.js {
        logger.info "Rendering JS"
        render nothing: true
        # layout: false
      }
    end
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
