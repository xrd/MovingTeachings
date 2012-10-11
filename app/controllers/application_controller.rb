class ApplicationController < ActionController::Base
  protect_from_forgery

  def reload
    redirect_to root_path()
  end
end
