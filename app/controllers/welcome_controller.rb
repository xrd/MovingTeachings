class WelcomeController < ApplicationController
  def index
  end

  def intro
    render layout: false
  end
end
