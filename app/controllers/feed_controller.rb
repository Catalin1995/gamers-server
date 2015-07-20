class FeedController < ApplicationController

  def index
      @all = Feed.all
  end

  def show
    begin
      @feed = Feed.find(params[:id])
    rescue
      render_response("Feed does not exist!", 400_031)
    end
  end

  def create

  end

end
