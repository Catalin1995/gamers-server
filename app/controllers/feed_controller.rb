class FeedController < ApplicationController

  def index
    @all = all_available_time
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

  def all_available_time
    time = Time.now
    @all = []
    for feed in Feed.all
      if feed.created_at >= Time.now - feed.hours.hours - feed.minutes.minutes
        @all.push(feed)
      end
    end
    @all
  end

end
