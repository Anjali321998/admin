class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
    	t.string :data
    	t.integer :liked
      t.timestamps
    end
  end
end