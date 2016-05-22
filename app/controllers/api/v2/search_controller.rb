class Api::V2::SearchController < ApplicationController
  before_action :authenticate_api_user!

  # GET /search?q=query
  def index
    results = []
    q = search_params[:q]

    if q
      results << Cocktial.search(q)
      results << Ingredient.search(q)
    end

    render json: results
  end

  private
    # Only allow a trusted parameter "white list" through.
    def search_params
      params.require(:search).permit(:q)
    end
end
