class Friends < ActiveRecord::Migration[6.0]
  def change
  	change_table :users do |t|
  		t.references :user
  	end
  end
end
