class ChangeFriends < ActiveRecord::Migration[6.0]
  def change
  	change_table :friends do |t|
  		t.remove :user_id
  		t.rename :reciever_id , :receiver_id
  	end
  end
end
