class DialecticsController < ApplicationController
  def teach
    respond_to do |format|
      format.html { render template: 'welcome/index' }
      format.json { render layout: false, template: 'dialectics/teach.html.haml' }
    end
  end

  def book
    render layout: false
  end
  
  def map
    render layout: false
  end
  
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
  
  def show
    @dialectic = Dialectic.find params[:id]
  end
  
  def learn
    respond_to do |format|
      format.html { render template: 'welcome/index' }
      format.json { render layout: false, template: 'dialectics/learn.html.haml' }
    end
  end

end
