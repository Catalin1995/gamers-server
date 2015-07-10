class GamesController < ApplicationController

  def index
    @all = Game.all()
  end

  def show
    pp params[:id]
    @game = Game.find(params[:id])
  end

end
