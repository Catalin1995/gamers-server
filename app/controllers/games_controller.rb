class GamesController < ApplicationController

  def index
    @all = Game.all()
  end

  def show
    @game = Game.find(params[:id])
  end

end
