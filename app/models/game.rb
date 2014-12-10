class Game < ActiveRecord::Base

  has_many :user_games
  has_many :users, through: :user_games
  has_many :options, through: :users


  def option_limit_met(user)
    if self.users.find(user.id).options.count > 0 
      return true
    end

  end

  def user_limit_met
    if self.users.count >= 2
      return true
    #errors.add(:user_id, 'Error - Game full')
    end
  end
end
