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

  def register
    dialectic = Dialectic.find params[:id]
    dialectic.register_user( current_user )
    RegistrationMailer.notify_registrant( dialectic, current_user ).deliver
    RegistrationMailer.notify_instructor( dialectic ).deliver
    render json: { status: 'ok' }
  end
  
  def create
    logger.info "Params: #{params[:dialectic]}"
    current_user.dialectics.create( params[:dialectic] )
    render json: { status: 'ok' }
  end

end
