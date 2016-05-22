class Api::V2::SearchController < ApplicationController
  before_action :authenticate_api_user!

  # GET /search?q=query
  def index
    results = []
    q = search_params[:q]
    p = search_params[:p]&.to_i

    if q
      results << Cocktail.search(q, p)
      results << Ingredient.search(q, p)
    end

    render json: results.flatten
  end

  private
    # Only allow a trusted parameter "white list" through.
    def search_params
      params.require(:search).permit(:q, :p)
    end
end
nd
