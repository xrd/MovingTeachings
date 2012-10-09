class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    raise env["omniauth.auth"].inspect
  end
  
  def facebook
    raise env["omniauth.auth"].inspect
  end
end
