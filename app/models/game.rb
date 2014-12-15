class Game < ActiveRecord::Base

  has_many :user_games, dependent: :destroy
  has_many :users, through: :user_games
  has_many :options, through: :users
  # before_destroy :destroy_options

  def option_limit_met(user)
    unless self.users.find(user.id).option.nil? 
      return true
    end
  end

  def self.num_users
    2
  end

  def user_limit_met
    if self.users.count >= Game.num_users
      return true
    #errors.add(:user_id, 'Error - Game full')
    end
  end
  
  def destroy_options
    options.map{|o| o.destroy}
  end

  def options_for user
    UserGame.find_by(user_id: user, game_id: self.id).options
  end

end