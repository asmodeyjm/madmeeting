class FrankController < ApplicationController
  before_action :authenticate_user!, except: [:index, :edit]
  def index
  end
end