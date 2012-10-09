class UsersController < ApplicationController
  def loggedIn
    render json: { loggedIn: current_user ? "1" : "0" }
  end
end
