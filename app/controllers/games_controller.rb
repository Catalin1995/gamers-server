class GamesController < ApplicationController
  def index
    @games = Game.all()
  end

  def show
    begin
      @game = Game.find(params[:id])
    rescue
      render_response("Game does not exist", 400_021)
    end
  end
end
