class AddUserGameToOption < ActiveRecord::Migration
  def change
    add_reference :options, :user_game, index: true
  end
end
