class RemoveUselessColumn < ActiveRecord::Migration[6.0]
  def change
  	remove_column :users, :user_id, :integer
  	remove_column :friends, :user_id, :integer
  end
end
