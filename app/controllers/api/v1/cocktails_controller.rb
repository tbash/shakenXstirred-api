class Api::V1::CocktailsController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_cocktail, only: [:show, :unsave_cocktail, :save_cocktail]

  # GET /cocktails
  def index
    @cocktails = Cocktail.all

    render json: @cocktails
  end

  # GET /cocktails/1
  def show
    render json: @cocktail
  end

  # PUT /cocktailss/1/save_cocktail
  def save_cocktail
    unless current_api_user.saved_cocktail? @cocktial
      current_api_user.save_cocktail @cocktial
    end
  end

  # DELETE /cocktails/1/unsave_cocktail
  def unsave_cocktail
    if current_api_user.saved_cocktail? @cocktial
      current_api_user.unsave_cocktail @cocktial
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find_by_name(params[:name])
    end
end
