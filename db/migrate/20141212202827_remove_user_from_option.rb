class RemoveUserFromOption < ActiveRecord::Migration
  def change
    remove_reference :options, :user, index: true
  end
end
