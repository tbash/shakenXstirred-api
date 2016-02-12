class FeedsController < ApplicationController

  # GET /feed
  def index
    @feed = current_user.followers_feed

    render json: @feed
  end
end
