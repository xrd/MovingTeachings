class DialecticsController < ApplicationController
  def register
  end

  def mine
    render json: current_user.dialectics
  end
  
  def create
    logger.info "Params: #{params[:dialectic]}"
    only_selected_days = params[:dialectic][:days].collect { |d|
      logger.info "Day: #{d.inspect}"
      d["selected"] == true ? d["name"] : nil
    }.compact
    logger.info "Selected: #{only_selected_days.inspect}"
    params[:dialectic][:days] = only_selected_days
    logger.info "Params: #{params[:dialectic]}"
    current_user.dialectics.create( params[:dialectic] )
    render json: { status: 'ok' }
  end

end
