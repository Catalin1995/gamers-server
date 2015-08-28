class GamefeedsController < ApplicationController
  def index
    @feeds = Feed.all.where(:game_id => params[:game_id])
    @feeds = all_available_time(@feeds)
  end

  private

  def all_available_time(feeds)
    @available = []
    @unavailable = []
    for feed in feeds
      if feed.created_at >= Time.now - feed.hours.hours - feed.minutes.minutes
        @available.push(feed)
      else
        @unavailable.push(feed)
      end
    end
    return [@available, @unavailable]
  end
end
