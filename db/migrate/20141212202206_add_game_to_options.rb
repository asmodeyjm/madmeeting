class AddGameToOptions < ActiveRecord::Migration
  def change
    add_reference :options, :game, index: true
  end
end
