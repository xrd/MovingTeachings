class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    raise env["omniauth.auth"].inspect
  end

  def google_oauth2
    facebook()
  end
  
  def facebook
    @user = User.find_for_oauth(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      message = env['omniauth.auth'].provider
      set_flash_message(:notice, :success, :kind => message.upcase ) if is_navigational_format?
    else
      session["devise.oauth_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
