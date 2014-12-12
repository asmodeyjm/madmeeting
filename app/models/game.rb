class Game < ActiveRecord::Base

  has_many :user_games, dependent: :destroy
  has_many :users, through: :user_games
  has_many :options, through: :users
  before_destroy :destroy_options

  def option_limit_met(user)
    unless self.users.find(user.id).option.nil? 
      return true
    end

  end

  def user_limit_met
    if self.users.count >= 2
      return true
    #errors.add(:user_id, 'Error - Game full')
    end
  end
  def destroy_options
    self.users.each {|u| u.option.destroy }
  end
end
