class FeedsController < ApplicationController
  before_action :authenticate_user!

  # GET /feed
  def index
    @feed = current_user.followers_feed

    render json: @feed
  end
end
