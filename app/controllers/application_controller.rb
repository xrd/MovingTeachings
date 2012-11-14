class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_login
    respond_to do |format| 
      format.js { render status: 401, text: 'unauthorized' unless current_user }
      format.html { redirect_to root_path }
    end
  end
  
  def reload
    redirect_to root_path()
  end
end
