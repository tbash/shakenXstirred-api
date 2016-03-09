class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]
  before_action :authenticate_user!

  # GET /cocktails
  def index
    @cocktails = Cocktail.all

    render json: @cocktails
  end

  # GET /cocktails/1
  def show
    render json: @cocktail
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end
end
