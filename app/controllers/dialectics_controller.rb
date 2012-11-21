class DialecticsController < ApplicationController

  before_filter :require_login, :except => [ :learn, :teach ]

  def learn
    render template: 'welcome/intro'
  end
  alias :teach :learn
  
  def register
  end

  def mine
    render json: current_user.dialectics
  end
  
  def create
    logger.info "Params: #{params[:dialectic]}"
    current_user.dialectics.create( params[:dialectic] )
    render json: { status: 'ok' }
  end

end
