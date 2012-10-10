class WelcomeController < ApplicationController
  def index
  end

  def login
    render layout: false
  end
  
  def intro
    render layout: false
  end
end
