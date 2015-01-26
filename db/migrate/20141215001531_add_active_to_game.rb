class AddActiveToGame < ActiveRecord::Migration
  def change
    add_column :games, :active, :boolean, default: false
    remove_column :options, :game_id
  end
end
