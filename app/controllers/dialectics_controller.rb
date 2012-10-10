class DialecticsController < ApplicationController
  def teach
    respond_to do |format|
      format.html { render template: 'welcome/index' }
      format.json { render layout: false, template: 'dialectics/teach.html.haml' }
    end
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
