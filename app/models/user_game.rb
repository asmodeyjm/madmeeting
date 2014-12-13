class UserGame < ActiveRecord::Base
  has_many :options, dependent: :destroy
  belongs_to :user
  belongs_to :game

  validates :user_id, uniqueness: {scope: :game_id, message: "You already joined this game."} 
  
end
