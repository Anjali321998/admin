class ChangePost < ActiveRecord::Migration[6.0]
  def change
  	remove_column :posts, :liked, :integer
  end
end
