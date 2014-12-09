class UserGame < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

 validates :user_id, uniqueness: {scope: :game_id, message: "You already joined this game."} 
  
end
