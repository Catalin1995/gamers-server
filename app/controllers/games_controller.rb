class GamesController < ApplicationController

  def index
    @all = Game.all()
  end

  def create
    @game = Game.new()
  end

end
