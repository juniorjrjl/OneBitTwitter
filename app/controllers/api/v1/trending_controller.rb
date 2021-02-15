class Api::V1::TrendingController < ApplicationController
  def index
    @trendings = Trending.last
    render json: @trendings
  end
end
