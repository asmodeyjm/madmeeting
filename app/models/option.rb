class Option < ActiveRecord::Base
  belongs_to :user_game
  belongs_to :game
end
