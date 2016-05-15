class Api::V2::UsersController < ApplicationController
  before_action :set_user, only: [:show, :follow, :unfollow]
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
    current_user.update(user_params)
    current_user.update_cocktails
  end

  # PUT /users/1/follow
  def follow
    unless current_user.following?(@user.id) || current_user == @user
      current_user.follow @user
    end
  end

  # DELETE /users/1/unfollow
  def unfollow
    if current_user.following?(@user.id)
      current_user.unfollow @user
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_name(params[:name])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(ingredient_ids: [])
    end
end