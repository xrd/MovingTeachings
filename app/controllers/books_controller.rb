class BooksController < ApplicationController
  def search
    render json: Hash.from_xml( Book.search( params[:text] ).body ).to_json
  end
end
