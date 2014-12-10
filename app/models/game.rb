class Game < ActiveRecord::Base

  has_many :user_games
  has_many :users, through: :user_games
  has_many :options, through: :users

  def validate_user_count
    if game.user.count >= 5
    errors.add(:user_id, 'Error - Game full')
    end
  end
end
