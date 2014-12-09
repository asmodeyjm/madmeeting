class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def join
    @game = Game.find(params[:id])

    @user_game = UserGame.create(user_id: current_user.id, game_id: @game.id)
  end


  def new
    @game = Game.new
  end

  def create
    
  end




end
