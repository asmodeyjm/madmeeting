class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id]) 

    if !current_user.current_game == @game
      redirect_to games_path
    else
      if @game.options_for(current_user).empty?
        redirect_to set_options_game_path(@game)
      elsif !@game.active
        flash[:error] = "Waiting on other users."
        redirect_to games_path
      end
    end

        


    # redirect_to games_path unless current_user.in_this_game?(@game)
  end

  def set_options
    @game = Game.find(params[:id]) 
    @user_game = UserGame.find_by(game: @game, user: current_user)
    if @game.active
      redirect_to games
    end
  end
  
  def join
    @game = Game.find(params[:id])

      if @game.user_limit_met
        flash[:error] = "Game is full!"
        redirect_to :back 
      else
         if !current_user.in_game? 
            @user_game = UserGame.create(user_id: current_user.id, game_id: @game.id)
            flash[:success] = "#{@game.title} was joined"
            redirect_to @user_game.game     
         else
            redirect_to game_path(current_user.current_game)
          end
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

    # if current_user.can_join_game?
    #   if current_user.current_game.active
    #     redirect_to game_path(current_user.current_game)
    #   else
    #     redirect_to set_options_game_path(current_user.current_game)
    #   end
    # else


end
