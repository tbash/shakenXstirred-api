class Api::V1::IngredientsController < ApplicationController
  before_action :authenticate_api_user!

  # GET /ingredients
  def index
    @ingredients = Ingredient.all

    render json: @ingredients
  end
end
