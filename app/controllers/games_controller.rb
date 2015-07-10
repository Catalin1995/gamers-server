class GamesController < ApplicationController

  def index
    @all = Game.all()
  end

end
