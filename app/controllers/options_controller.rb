class OptionsController < ApplicationController
  def create
    @option = Option.new(option_params)
    if @option.save
      flash[:success] = "Added the trigger."
      redirect_to :back
    else
      flash[:error] = "There was a problem adding that option."
      render action: :new
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


