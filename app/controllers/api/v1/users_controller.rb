class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_user!

  # GET /me
  def me
    render json: current_api_user
  end

  # PUT /update_inventory
  def update_inventory
    current_api_user.update_inventory(params[:user][:ingredient_ids])
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(ingredient_ids: [])
    end
end
