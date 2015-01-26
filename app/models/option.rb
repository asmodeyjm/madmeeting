class Option < ActiveRecord::Base
  belongs_to :user_game

  # after_create :check_ready_status?
  after_create :start_game


  def players_ready?
    players = self.user_game.game.user_games
    options_ready = players.map{ |player| player.options.any? }
    options_ready.size == Game.num_users && !options_ready.include?(false)
  end


  def start_game
    if players_ready?
      game = self.user_game.game
      game.active = true
      game.save
    end
  end

end
