class ChangeLikes < ActiveRecord::Migration[6.0]
  def change
  	remove_column :likes,:like_status,:integer
  	add_column :likes,:user_id,:integer
  end
end
