class OptionsController < ApplicationController



  def create
    puts "TEST"
    puts params[:option][:game_id]
    @game = Game.find(params[:option][:game_id])
    @option = Option.new(option_params)

      if @game.option_limit_met(current_user)
        flash[:error] = "You've already added an option."
        redirect_to :back
      else
        flash[:success] = "You added an option!"
        redirect_to :back
      
      end   
  end
  def destroy
    @option = Option.find(params[:id])
    @option.destroy
  end

 private
  def option_params
    params[:option].permit(:description, :user_id)
  end
end


