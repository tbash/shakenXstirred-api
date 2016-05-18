class Api::V2::UsersController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_user, only: [:show, :follow, :unfollow]

  # GET /me
  def me
    render json: current_api_user
  end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # PUT /update_inventory
  def update_inventory
    current_api_user.update_inventory(user_params[:ingredient_ids])
  end

  # PUT /users/1/follow
  def follow
    current_api_user.follow @user unless current_api_user == @user
  end

  # DELETE /users/1/unfollow
  def unfollow
    current_api_user.unfollow @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_name(params[:name])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:ingredient_ids => [])
    end
end
