class UsersController < ApplicationController
  before_action :set_user, only: [:show, :follow]
  before_action :authenticate_user!

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /update_inventory
  def update_inventory
    current_user.update_inventory(params[:ingredient_ids])
  end

  # POST /users/1/follow
  def follow
    current_user.follow @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(ingredient_ids: [])
    end
end
