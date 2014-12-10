class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id]) 
  end
  
  def join
    @game = Game.find(params[:id])
    puts "TEST"
    puts @game.user_limit_met
    if @game.user_limit_met
      flash[:notice] = "Game is full!"
      redirect_to :back  
     else
      @user_game = UserGame.create(user_id: current_user.id, game_id: @game.id)
      flash[:notice] = "#{@game.title} was joined"
      redirect_to @user_game.game     
    end
  end


  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:success] = "Added game."
      redirect_to games_path
    else
      flash[:error] = "There was a problem adding that game."
      render action: :new
    end
  end

private
  

  def game_params
    params[:game].permit(:title)
  end



end
