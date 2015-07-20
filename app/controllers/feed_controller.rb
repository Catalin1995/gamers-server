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
    begin
      @feed = Feed.create!(feed_params)
    rescue
      render_response("Can't create feed!", 400_032)
    end
  end

  private

  def feed_params
    params.require(:feed).permit(:game_id, :user_id, :hours, :minutes)
  end

end
