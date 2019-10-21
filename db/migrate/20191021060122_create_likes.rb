class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
    	t.integer :like_status

      t.timestamps
    end
  end
end
