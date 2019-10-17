class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
    	t.integer :sender_id
    	t.integer :reciever_id
    	t.integer :status
    	t.references :users
      t.timestamps
    end
  end
end
