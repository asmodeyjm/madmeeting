class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.references :user, index: true
      t.string :description

      t.timestamps
    end
  end
end
