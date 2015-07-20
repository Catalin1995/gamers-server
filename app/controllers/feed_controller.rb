class FeedController < ApplicationController

  def index
      @all = Feed.all
  end

  def show
    pp params
  end

  def create

  end

end
