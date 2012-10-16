class BooksController < ApplicationController

  def search
    render Book.search( params[:text] ).to_json
  end
end
