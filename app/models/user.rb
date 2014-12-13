class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_one :user_game
  has_many :games, through: :user_game
  has_many :options, through: :user_game

  def game
    self.games.first
  end

  def option
    self.options.first
  end


  def in_game?
    UserGame.where(user_id: self.id).any?
  end
end

# unless current_user.in_game
#   join game
# else
#   notice
# end